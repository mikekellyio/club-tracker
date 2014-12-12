require 'rails_helper'

RSpec.describe Child, :type => :model do
  describe "is valid when" do
    it "has a first_name" do
      expect(Child.new(first_name: "first", last_name: "last")).to be_valid
      expect(Child.new(last_name: "last")).to_not be_valid
    end
    it "has a last_name" do
      expect(Child.new(first_name: "first", last_name: "last")).to be_valid
      expect(Child.new(first_name: "first")).to_not be_valid
    end
  end
  describe "complete_next!" do
    let(:child) {Child.new(first_name: "first", last_name: "last")}
    it "raises an error if no current_book present" do
      expect {child.complete_next!}.to raise_error
    end

    context "when no CompletedSection" do
      it "creates a new CompletedSection" do
        child.current_book = Book.new()
        child.current_book.sections << Section.new(name: "red 1")
        expect {
          child.complete_next!
        }.to change {child.completed_sections.size}.by 1
      end
    end

    context "when CompletedSection#complete_next! is nil" do
      it "adds the completed section to its list" do
        child.current_book = Book.new()
        last_section = Section.new(name: "green 1")
        child.current_book.sections << [ Section.new(name: "red 1"), last_section]
        sp = child.completed_sections.build section: child.current_book.sections.first
        allow(sp).to receive(:complete_next!).and_return nil
        allow(sp).to receive(:get_next).and_return last_section

        expect {
          child.complete_next!
        }.to change {child.completed_sections.size}.by 1
      end
      context "when CompletedSection#get_next is nil" do
        it "adds the completed book to its list" do
          child.current_book = Book.new()
          child.current_book.sections << Section.new(name: "red 1")
          sp = child.completed_sections.build section: child.current_book.sections.first
          allow(sp).to receive(:complete_next!).and_return nil
          allow(sp).to receive(:get_next).and_return nil

          expect {
            child.complete_next!
          }.to change {child.completed_books.size}.by 1
        end
      end
    end
  end
end

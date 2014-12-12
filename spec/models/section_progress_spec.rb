require 'rails_helper'

RSpec.describe SectionProgress, :type => :model do
  let(:section) {
    Section.new name: 'red 1',
      sub_sections: [SubSection.new(name: '1')]
    }

  context "validations" do
    describe "presence of Section" do
      it "is valid when present" do
        expect(SectionProgress.new(section: section)).to be_valid
      end
      it "is invalid when missing" do
        expect(SectionProgress.new()).to_not be_valid
      end
    end
  end

  describe "complete_next!" do

    it "adds the first subsection to a blank completed collection" do
      sp = SectionProgress.new section: section
      expect {
        sp.complete_next!
      }.to change {sp.completed_subsections.size}.by(1)
      expect(sp.completed_subsections.first.sub_section).to eq(section.sub_sections.first)
    end

    it "adds the next subsection to an in-progress completed collection" do
      last_subsection = SubSection.new(name: '2')
      section.sub_sections << last_subsection

      sp = SectionProgress.new section: section
      first_subsection = sp.completed_subsections.build(sub_section: section.sub_sections.first)
      allow(first_subsection).to receive(:get_next).and_return(last_subsection)

      sp.complete_next!

      expect(sp.completed_subsections.last).to eq(last_subsection)
    end

    it "is nil if all subsections are complete" do
      sp = SectionProgress.new section: section
      first_subsection = sp.completed_subsections.build(sub_section: section.sub_sections.first)
      allow(first_subsection).to receive(:get_next).and_return(nil)

      expect(sp.complete_next!).to be_nil
    end
  end
end

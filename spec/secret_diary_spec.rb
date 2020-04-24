require_relative '../lib/secret_diary'

### WARNING ###
# For the purposes of this exercise, you are testing after
# the code has been written. This means your tests are prone
# to false positives!
#
# Make sure your tests work by deleting the bodies of the
# methods in `secret_diary.rb`, like this:
#
# ```ruby
# def write(new_message)
# end
# ```
#
# If they fail, then you know your tests are working
# as expected.
### WARNING ###

RSpec.describe SecretDiary do

  let(:diary) { double() }
  let(:subject) { described_class.new(diary) }
  let(:message) { String.new("") }

  context "when locked" do
    it "refuses to be read" do
      expect(diary).to_not receive(:read)
      subject.read
    end

    it "refuses to be written" do
      expect(diary).to_not receive(:write)
      subject.write(message)
    end
  end

  context "when unlocked" do
    it "gets read" do
      expect(diary).to receive(:read)
      subject.unlock
      subject.read
    end

    it "gets written" do
      expect(diary).to receive(:write)
      subject.unlock
      subject.write(message)
    end
  end
end

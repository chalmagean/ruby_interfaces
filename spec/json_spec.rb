shared_examples "a JSON serializable object" do
  let(:subject) { described_class.new }
  it { is_expected.to respond_to(:to_json) }
  it { is_expected.to respond_to(:from_json).with(1).argument }

  describe "#to_json" do
    it "serializes its attributes in JSON format" do
      obj = described_class.new("John", "32")
      expect(obj.to_json).to eq('{"name":"John","age":"32"}')
    end
  end

  describe "#from_json" do
    it "changes the attributes based on the payload" do
      obj = described_class.new("John", 32)
      obj.from_json('{"name": "BOB", "age": "46"}')
      expect(obj.name).to eq("BOB")
      expect(obj.age).to eq("46")
    end
  end
end

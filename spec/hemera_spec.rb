RSpec.describe Hemera do
  it "has a version number" do
    expect(Hemera::VERSION).not_to be nil
  end
  context 'xcode' do
    it 'open' do
      Hemera::Xcode.open '.'
    end

    it 'clean' do
      Hemera::Xcode.clean
    end
  end

  context 'meta' do
    it 'meta image swift' do
      Hemera::Meta.generate('ImageModel', true)
    end
    it 'meta image objc' do
      Hemera::Meta.generate('ImageModel', false)
    end
    after(:context) do
      system 'rm ImageModel.*'
    end 
  end
end

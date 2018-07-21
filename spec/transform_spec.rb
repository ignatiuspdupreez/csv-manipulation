require './lib/transform.rb'

describe Transform do
  it 'reads the file' do
    transform = Transform.new('Loans.csv')
    expect(File).to receive(:open)
    transform.process
  end
end

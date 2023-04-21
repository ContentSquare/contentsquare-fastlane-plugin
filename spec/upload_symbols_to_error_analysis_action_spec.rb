describe Fastlane::Actions::UploadSymbolsToErrorAnalysisAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The contentsquare-fastlane-plugin plugin is working!")

      Fastlane::Actions::UploadSymbolsToErrorAnalysisAction.run(nil)
    end
  end
end

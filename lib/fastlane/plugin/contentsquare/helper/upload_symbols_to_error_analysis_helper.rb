module Fastlane
  module Helper
    class UploadSymbolsToErrorAnalysisHelper
      def self.upload_symbols(dsyms_path:, project_id:, client_id:, client_secret:)
        path = File.expand_path("upload-symbols", File.dirname(__FILE__))
        system(path, dsyms_path,
               "--project-id", project_id.to_s,
               "--client-id", client_id,
               "--client-secret", client_secret)
      end
    end
  end
end

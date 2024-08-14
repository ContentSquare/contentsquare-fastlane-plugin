module Fastlane
  module Helper
    class UploadSymbolsToErrorAnalysisHelper
      def self.upload_symbols(dsyms_path:, project_id:, client_id:, client_secret:, proxy:, verbose:)
        path = File.expand_path("upload-symbols", File.dirname(__FILE__))
        args = [
          path,
          dsyms_path,
          "--project-id", project_id.to_s,
          "--client-id", client_id,
          "--client-secret", client_secret,
          "--proxy", proxy
        ]
        
        args << "--verbose" if verbose
        system(*args)
      end
    end
  end
end

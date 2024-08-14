require 'fastlane/action'
require_relative '../helper/upload_symbols_to_error_analysis_helper'

module Fastlane
  module Actions
    class UploadSymbolsToErrorAnalysisAction < Action
      def self.run(params)
        Helper::UploadSymbolsToErrorAnalysisHelper.upload_symbols(
          dsyms_path: params[:dsyms_path],
          project_id: params[:project_id],
          client_id: params[:client_id],
          client_secret: params[:client_secret],
          proxy: params[:proxy],
          verbose: params[:verbose]
        )
      end

      def self.description
        "Upload dSYM files to Error Analysis to symbolicate crashes"
      end

      def self.authors
        ["Contentsquare"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        "Upload dSYM files to Error Analysis to symbolicate crashes"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :dsyms_path,
                               description: "Path where the dSYM files are located",
                             default_value: Actions.lane_context[SharedValues::DSYM_OUTPUT_PATH],
                                  optional: true,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :project_id,
                                  env_name: "ERROR_ANALYSIS_PROJECT_ID",
                               description: "Project ID",
                                  optional: false,
                                      type: Integer),
          FastlaneCore::ConfigItem.new(key: :client_id,
                                  env_name: "ERROR_ANALYSIS_CLIENT_ID",
                               description: "Client ID",
                                  optional: false,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :client_secret,
                                  env_name: "ERROR_ANALYSIS_CLIENT_SECRET",
                               description: "Client secret",
                                  optional: false,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :proxy,
                                  env_name: "ERROR_ANALYSIS_PROXY",
                               description: "Proxy",
                                  optional: true,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :verbose,
                                  env_name: "ERROR_ANALYSIS_VERBOSE",
                               description: "Enable verbose mode to print more detailed output",
                                 is_string: false,
                                  optional: true,
                                      type: Boolean)
        ]
      end

      def self.is_supported?(platform)
        [:ios].include?(platform)
      end
    end
  end
end

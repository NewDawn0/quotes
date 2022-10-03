##### Imports #####
require "option_parser";

##### Functions #####
OptionParser.parse do |parser|
    parser.banner = "Quotes - by NewDawn0"
    parser.on "-v", "--version", "Show version" do
        puts banner
        puts "on v1.0.0"
        exit
    end
    parser.on "-h", "--help", "Show help" do
        puts parser
        exit
    end
end


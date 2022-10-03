##### Imports #####
require "option_parser";
require "json";
require "http/client";

##### Functions #####
## Parse args ##
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
    parser.on "-r", "--random", "Show random quote" do
        fetch
    end
end
fetch()

## fn fetch ##
def fetch
    res = HTTP::Client.get "https://stoicquotesapi.com/v1/api/quotes/random"
    if res.status_code == 200
        res = JSON.parse(res.body)
        quote = res["body"]
        author = res["author"]
        puts "#{quote}\t -- #{author}"
        exit
    end
end
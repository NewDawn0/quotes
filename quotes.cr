##### Imports #####
require "option_parser";
require "json";
require "http/client";

##### Functions #####
## Parse args ##
OptionParser.parse do |parser|
    banner = "Quotes - by NewDawn0"
    parser.banner = "#{banner}\nUsage: quotes [arguments]"
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
        fetch("random")
    end
    parser.on("-n NAME", "--name NAME", "Gets a quote by the name entered") { |name| fetch(name.titleize, author=true) }
    parser.invalid_option do |flag|
        STDERR.puts "Error: #{flag} is not a valid option"
        STDERR.puts parser
        exit(1)
    end
end
fetch("random")

## fn fetch ##
def fetch(input, author=false)
    baseUrl = "https://stoicquotesapi.com/v1/api/quotes"
    res = HTTP::Client.get "#{baseUrl}/#{input}"
    if res.status_code == 200
        res = JSON.parse(res.body)
        if author == true
          rand = Random.rand(10)
          quote = res["data"][rand]["body"]
          author = res["data"][rand]["author"]
        else
          quote = res["body"]
          author = res["author"]
        end
        puts "#{quote}\t -- #{author}"
        exit
    else
        STDERR.puts "Couldn't get quotes"
        exit(1)
    end
end

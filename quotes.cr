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
        fetch
    end
    parser.on("-n NAME", "--name NAME", "Gets a quote by the name entered") { |name| fetchName(name.titleize) }
    parser.invalid_option do |flag|
        STDERR.puts "Error: #{flag} is not a valid option"
        STDERR.puts parser
        exit(1)
    end
end
fetch

## fn fetch ##
def fetch
    baseUrl = "https://stoicquotesapi.com/v1/api/quotes"
    res = HTTP::Client.get "#{baseUrl}/random"
    if res.status_code == 200
        res = JSON.parse(res.body)
        quote = res["body"]
        author = res["author"]
        puts "#{quote}\t -- #{author}"
        exit
    end
end
## fetch by name ##
def fetchName(input)
    baseUrl = "https://stoicquotesapi.com/v1/api/quotes"
    res = HTTP::Client.get "#{baseUrl}/#{input}"
    if res.status_code == 200
        res = JSON.parse(res.body)
        rand = Random.rand(10)
        quote = res["data"][rand]["body"]
        author = res["data"][rand]["author"]
        puts "#{quote}\t -- #{author}"
        exit
    else
        STDERR.puts "Couldn't get quotes"
        exit(1)
    end
end
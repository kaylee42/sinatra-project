class ApplicationController < Sinatra::base
  enable :method_override
  set :root, File.join(__dir__, "..")


get '/' do
  erb :index
end

end

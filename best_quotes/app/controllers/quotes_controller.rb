class QuotesController < Rulers::Controller
  def index
    quotes = FileModel.all
    @browser = "IE sucks nuts"
    #@ua = request.user_agent
    render :index, :quotes => quotes
  end

  def quote_1
    quote_1 = FileModel.find(1)
    render :quote, :obj => quote_1
  end

  def a_quote
    @verb = "licking"
    @noun = "Izze"
    render :a_quote
  end

  def exception
    raise "It's a bad one!!!"
  end

  def new_quote
    attrs = {
      "submitter" => "web user",
      "quote" => "A picture is worth a thousand pixels",
      "attribution" => "Me"
    }
    m = FileModel.create attrs
    render :quote, :obj => m
  end
end

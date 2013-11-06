class QuotesController < Rulers::Controller
  def index
    @browser = "IE sucks nuts"
    #@ua = request.user_agent
    render :index
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
end

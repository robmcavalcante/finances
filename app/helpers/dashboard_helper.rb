module DashboardHelper
  def balance
    revenue - expenses
  end
  
  def revenue
    revenues = Revenue.all

    total = 0
    revenues.map {|revenue| total = total + revenue.value}

    total
  end
  
  def expenses
    current_month_year = Date.today.strftime("%m%Y")

    transactions = Transaction.where("date LIKE '%#{current_month_year}%'")

    total = 0
    transactions.map {|transaction| total = total + transaction.value}

    total
  end
  
  def available_credit_limit
    cards = Card.all

    total = 0 
    cards.map {|card| total = total + card.limit}

    total - expenses
  end
end
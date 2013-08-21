require 'sinatra'
before do
  content_type :txt
  @aBeatsB = {rock: :scissors, paper: :rock, scissors: :paper}
  @legalOffers = @aBeatsB.keys
end

get '/' do
  out = "Let's play rock, paper, scissors!\n\r"
  out += "use the URL .../offer/rock (or paper or scissors)\n\r"
  out += "Let's go!\n\r"
  $built_response = out
  #halt [418, "i'm a tea pot"]
end

post '/' do
  atfoo = params[:foo]
  out = "there's your foo POST! with :#{params}:\n\r"
  #out = "there's your POST!\n"
  $built_response = out

end

post '/wfoo' do
  atfoo = params[:foo]
  out = "hey here's your foo POST! with :#{atfoo}:."
  $built_response = out
end

get '/offer/:offerRaw' do
  # the params[] hash stores querystring and form data.
  player_offer = params[:offerRaw].to_sym
  out = "You offered" + ": " + "#{player_offer} ... "
  p out
  p player_offer

  if !@legalOffers.include?(player_offer)
    p "AC> unknown offering"
    p player_offer
    halt 403, "Boo, this string doessn't come out! sadface"
    #" must offer one of the following: #{@legalOffers}"
  end

  computer_offer = @legalOffers.sample
  computer_offer = :paper
  out += "I chose" + ": " + "#{computer_offer}.\n\r"

  if player_offer == computer_offer
     out += "That makes a tie.\n Play again."
  elsif computer_offer == @aBeatsB[player_offer]
    out += "You win!"
  else
    out += "I win!"
  end

  $built_response = out
end

post '/rockscissorsspaper' do
    player_offer = params[:offer].to_sym
    out = "You:#{player_offer} "

    if !@legalOffers.include?(player_offer)
      halt 403, "Boo, this string doessn't come out! sadface"
    end

    computer_offer = @legalOffers.sample
    computer_offer = :paper
    out += "me:#{computer_offer}. "

    if player_offer == computer_offer
      out += "Tie."
    elsif computer_offer == @aBeatsB[player_offer]
      out += "You win!"
    else
      out += "I win!"
  end

    $built_response = out

end
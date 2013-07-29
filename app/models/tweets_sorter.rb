@array_tweets = []
@array_tweets = ["See the world — win a trip to NYC, London, LA, and SF to meet with top entrepreneurs and visit @GA: https://t.co/dZDSBOIvrg", "RT @fancy_N_girl: early #FF @RealTeamSheamus\n@HEELPaulax0\n@WWENERD14\n@iC__C\n@Team_CmPunkBITW\n@IMlitacalaway\n@adoringAJLee\n@Caitlin_BITW\n@ga…", "See the world — win a trip to NYC, London, LA, and SF to meet with top entrepreneurs and visit @GA: http://t.co/Ngn05QDcGj", "See the world — win a trip to NYC, London, LA, and SF to meet with top entrepreneurs and visit @GA: https://t.co/uriMyig1mu", "RT @GA: What a good looking group — must be their matching hoodies: http://t.co/7CBZcOJIGM @WDI_5 #classphoto", "RT @nycgov: On 7/30 join @GA and @FlatironNY for #free “Intro to NYC startup community” tech class 6-7:30pm on the Public Plaza: http://t.c…", "RT @ImMicMad: See the world — win a trip to NYC, London, LA, and SF to meet with top entrepreneurs and visit @GA: https://t.co/DUO5mI092S", "See the world — win a trip to NYC, London, LA, and SF to meet with top entrepreneurs and visit @GA: https://t.co/DUO5mI092S", "See the world — win a trip to NYC, London, LA, and SF to meet with top entrepreneurs and visit @GA: https://t.co/DSWKuWuob2", "See the world — win a trip to NYC, London, LA, and SF to meet with top entrepreneurs and visit @GA: https://t.co/WwJRTy3h2e"]

start_time = Time.now
puts "Start time: " + start_time.inspect

freqs = Hash.new(0)
@words = @array_tweets.join(" ")

# need to remove @ punctuation symbols, http:// and what about #s?

@array_words = @words.split(" ")

@array_words.each { |w| freqs[w] += 1 }

end_time = Time.now
puts "End time: " + end_time.inspect
puts "Total time: #{end_time - start_time}"

#freqs = freqs.sort_by {|x,y| y }
#freqs.reverse!
#freqs.each {|word, freq| puts word+' '+freq.to_s}

puts freqs
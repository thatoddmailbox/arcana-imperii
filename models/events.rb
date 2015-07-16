$events = {
  1 => {
    :message => "Welcome, (name), Our Most Glorious Leader of (country)! This is your first day in office. The people hold a parade in your honor. How will you take advantage of the high spirit of the populace?",
    :choices => {
      "Ask for donations" => :generous_donation,
      "Ask for recruits" => :influx_of_recruits
    }
  },
  2 => {
    :message => "Our Most Glorious Leader! A envoy from (enemy_country) has arrived. He demands you recognize (enemy_country)'s sovereignty over (country). How will you respond to this outrage?",
    :choices => {
      "Capitulate" => :annexation,
      "Slap him"   => :declaration_of_war
    }
   },
    3 => {
      :message => "Our Most Glorious Leader, we need to mobilize our army if we have any chance of defeating of defeating (enemy_country) we must mobilize our troops if we have any chance of winning our war. We could either mobilzie our normal army or draft more citizens to increase our army size. What should we do?",
    :choices => {
      "Normal Mobilization" => :mobilize,
      "Draft more citizens"   => :harsh_draft
    }
   },
   4 => {
     :message => "Our Most Glorius Leader, our long time ally (ally_country) has, of course, come to our aid in our fight against (enemy_country). They are offering to either send us immediate aid or declare war on (enemy_country). What sould we ask for? ",
    :choices => {
      "Aid" => :ally_aid,
      "Military cooperation" => :ally_declares
    }
  },
    5 => {
      :message => "Our Most Glorious Leader, should we raise war taxes to support the war effort?",
    :choices => {
      "Yes" => :taxes,
      "Yes, but only a little" => :generous_donation,
      "No"   => :people_approve
    }
   },
  6 => {
    :message => "Our Most Glorius Leader, using our state funds we could hire mercenaries to help us in our fight. They would cost us 75,000 (currency). Do you think we can afford the cost?",
    :choices => {
      "Yes" => :mercenaries,
      "No"   => :nothing
    }
   },
    7 => {
      :message => "Our Most Glorious Leader! A pacifist group is protesting in the public sqaure against the war! Obviosly their message is non-sense and we must deal with them. How should we go about it?",
    :choices => {
      "Bribes" => :small_bribe,
      "Send in the army" => :public_outrage
    }
   },
    8 => {
      :message => "Our Most Glorious Leader! The armies of (enemy_country) are beggining to cross the border. We could dedicate troops to guarding villages and towns as the people want, at the expense of our troops the can be used in combat. Do you think we should?",
    :choices => {
      "Yes" => :troops_used_for_people,
      "We cannot afford thew troops" => :nothing
    }
   },
    9 => {
      :message => "Our Most Glorious Leader, an interesting situation has arisen. A wealthy government offical has died and he has left his money to charity. This would no doubt improve the people's view of our government, but we could also pocket the money for the needs of the state. What do you think is right?", 
    :choices => {
      "Do as he wished" => :people_approve,
      "The state needs the funds" => :generous_donation
    }
   },
    10 => {
    :message => "Our Most Glorious Leader! A envoy from (enemy_country) has arrived. He demands you recognize (enemy_country)'s sovereignty over (country). How will you respond to this outrage?",
    :choices => {
      "Capitulate" => :annexation,
      "Slap him"   => :declaration_of_war
    }
   }
 }

$messages = {
  :generous_donation => "Money for your government flows in.", #25,000 dollars
  :influx_of_recruits => "Citizens rush to join the army.", #250 troops
  :annexation => "You have been annexed by (enemy_country)", #you lose
  :declaration_of_war => "(enemy_country) has declared war on (country)! Our armies will destroy them on the field of battle.",
  :ally_aid => "Our longtime ally sends us money", #gives 75,000 dollars
  :ally_declares => "Our longtime ally has joined us in war against (enemy_country)", #allies comes into war
  :mobilize => "Our army is ready for combat", #2000 troops
  :harsh_draft => "Our army size has increased, but the people are displeased", #3000 troops, lose 20% approval
  :taxes => "We have more funds to work with, but the people are displeases", #50,000 dollars, lose 20% approval
  :people_approve => "The people approve of your discision", #gain 20 % approval
  :mercenaries => "We shall hire them at once", #gain 1000 troops. lose 75000 dollars
  :nothing => "As you wish",
  :small_bribe => "By libral use of funds, the problem goes away", #lose 10000 dollars
  :public_outrage => "The people are outraged by your disicion! Public support for you wanes." #lose 30% approval
  :troops_used_for_people => "The people are happy you are protecting their homes" #gain 15% approval lose 500 troops
  
}
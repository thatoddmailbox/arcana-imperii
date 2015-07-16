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
  }
 }

$messages = {
  :generous_donation => "Donations for your government flow in.", #25,000 dollars
  :influx_of_recruits => "Citizens rush to join the army.", #250 troops
  :annexation => "You have been annexed by (enemy_country)", #you lose
  :declaration_of_war => "(enemy_country) has declared war on (country)! Our armies will destroy them on the field of battle.",
  :ally_aid => "Our longtime ally sends us money and military supplies", #gives 75,000 dollars
  :ally_declares => "Our longtime ally has joined us in war against (enemy_country)", #allies comes into war
  :mobilize => "Our army is ready for combat", #2000 troops
  :harsh_draft => "Our army size has increased, but the people are displeased" #300 troops, lose 10% approval
}
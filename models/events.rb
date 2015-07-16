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
     :message => "Our long time ally (ally_country) has, of course, come to our aid in our fight against (enemy_country). They are offering to either send us immediate aid or declare war on (enemy_country). What sould we ask for? ",
    :choices => {
      "Aid" => :ally_aid,
      "Military cooperation"   => :ally_declares
    }
  }
 }

$messages = {
  :generous_donation => "Donations for your government flow in.",
  :influx_of_recruits => "Citizens rush to join the army."
  :annexation => "You have been annexed by (enemy_country)"
  :declaration_of_war => "(enemy_country) has declared war on (country)! Our armies will destroy them on the field of battle."
}
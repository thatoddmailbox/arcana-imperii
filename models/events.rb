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
  }
}

$messages = {
  :generous_donations => "Donations for your government flow in.",
  :influx_of_recruits => "Citizens rush to join the army."
}
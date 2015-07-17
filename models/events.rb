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
      :message => "Our Most Glorious Leader, we need to mobilize our army if we have any chance of defeating (enemy_country). We could either mobilzie our normal army or draft more citizens to increase our army size. What should we do?",
    :choices => {
      "Normal Mobilization" => :mobilize,
      "Draft more citizens"   => :harsh_draft
    }
   },
   4 => {
     :message => "Our Most Glorious Leader, our long time ally (ally_country) has, of course, come to our aid in our fight against (enemy_country). They are offering to either send us immediate aid or declare war on (enemy_country). What sould we ask for?",
    :choices => {
      "Aid" => :ally_aid,
      "Military cooperation" => :ally_declares
    }
  },
    5 => {
      :message => "Our Most Glorious Leader, should we raise our taxes to support the war effort?",
    :choices => {
      "Yes" => :taxes,
      "Yes, but only a little" => :generous_donation,
      "No"   => :people_approve
    }
   },
  6 => {
    :message => "Our Most Glorious Leader, using our state funds we could hire mercenaries to help us in our fight. They would cost us 75,000 (currency). Do you think we can afford the cost?",
    :choices => {
      "Yes" => :mercenaries,
      "No"   => :nothing
    }
   },
    7 => {
      :message => "Our Most Glorious Leader! A pacifist group is protesting in the public square against the war! Obviously, their message is non-sense and we must deal with them. How should we go about it?",
    :choices => {
      "Bribes" => :small_bribe,
      "Send in the army" => :public_outrage
    }
   },
    8 => {
      :message => "Our Most Glorious Leader! The armies of (enemy_country) are begining to cross the border. We could dedicate troops to guarding villages and towns as the people want, at the expense of our troops that can be used in combat. Do you think we should?",
    :choices => {
      "Yes" => :troops_used_for_people,
      "We cannot afford the troops" => :nothing
    }
   },
    9 => {
      :message => "Our Most Glorious Leader, an interesting situation has arisen. A wealthy government offical has died and he has left his money to charity. This would no doubt improve the people's view of our government, but we could also pocket the money for the needs of the state. What do you think is right?", 
    :choices => {
      "Do as he wished" => :people_approve,
      "The state needs the funds" => :generous_donation
    }
   },
  10 => { #when approval goes below 10%     
    :message => "My Most Glorious Leader... The people revolt in the streets. They chant \"down with (name)!\" Effigies of you are burned across (country), and loyalists are slaughtered en masse. The army is no longer loyal to you and the police have no control. Looting and rioting are commonplace. We have lost control. There is nothing to be done...",
    :choices => {
      "So be it." => :revolution,
      "As what kind of artist do I die?" => :revolution,
      "What did I do?" => :revolution    
    }
   },
   11 => {
     :message => "Our Most Glorious Leader. One of your advisors has proposed a propaganda campaign in order to recruit more soldiers. He says it would cost 10,000 (currency) and promises results. He awaits your approval.",
     :choices => {
       "Let's do it" => :military_propaganda,
       "We cannot afford it"   => :nothing      
     }
   },
   12 => {
     :message => "Our Most Glorious Leader! As the war drags on, people are displaced, fields are burned, and supply routes are cut. These factors have caused acute shortages of food and people are starving in the streets. They beg for help and resentment towards our government is rising. The cost of alleviating the situation is estimated to be 40,000 (currency), but the people would see you as a hero. What should we do?",
     :choices => {
       "We must act!" => :helping_hungry,
       "We cannot help."   => :people_starving,
       "Let them eat cake." => :public_outrage
     }
   },
  13 => {#flavor
    :message => "Our Most Glorious Leader. What strange and confused times we live in! A man has come in ragged clothing claiming he came from a desert! What should we do with this insane man?",
    :choices => {
      "Throw him in the asylum" => :nothing,
      "Keep him in my court"   => :nothing
    }
   },
  14 => {
    :message => "Our Most Glorious Leader. A minister has proposed a radical plan. He proposes to repossess the property of political dissidents in order to fund our war. The people will be deeply displeased, but desperate times call for desperate measures. Do you agree?", 
    :choices => {
      "Yes" => :desperate_measures,
      "No"   => :nothing
    }
   },
  15 => {
    :message => "Our Most Glorious Leader! News from the front! A medium size town is under siege! We could send in the troops to lift the siege, but there may be losses. Alternatively, we could pay money to keep the supplies flowing and we would not need as many soldiers to hold back the invaders. Perhaps it would be best to just let it fall. Keep in mind, the people like decisive victories and not defeats. What plan should we follow?",
    :choices => {
      "Lift the siege!" => :great_victory,
      "We will hold them back!"   => :city_holds,
      "We must let it fall" => :city_lost
    }
   },
  16 => {
    :message => "Our Most Glorious Leader! A conversation between generals of (enemy_country) has been intercepted! They are planning an all-out attack 6 days from now. With this intelligence we can prepare a counterattack. We estamate the attacking force to be 7,000 strong, give or take a couple hundred. This is our chance to decisively win the war!",
    :choices => {
      "We will be victorious" => :daystobattle5
    }
   },
  17 => {
    :message => "Our Most Glorious Leader! A call has gone out for extra soldiers in preparation for this major confrontation. Should we add monetary compensation to encourage citizens to sign-up?",
    :choices => {
      "Yes" => :encouraged_recruitment,
      "No, we cannot afford it"   => :good_recruitment
    }
   },
  18 => {#only triggered if ally join in the war
    :message => "Our Most Glorious Leader! Our steadfast ally, (ally_country), has sent us a message. They will contribute 1,000 troops to the upcoming battle. Victory draws closer!",
    :choices => {
      "Okay" => :ally_supports
    }
   },
  19 => {#run if ally is not in the war
    :message => "Our Most Glorious Leader! Our ally (ally_country) is not techincally at war with (enemy_country), and as such it would be a diplomatic catsrophe if their troops participated in combat. However, they are offering to supply us with a thousand mercanaries for 80,000 (currency). Do you think we should accept that deal?",
    :choices => {
      "Yes" => :ally_mercenaries,
      "No"   => :nothing
    }
   },
  20 => {
    :message => "Our Most Glorious Leader! Due to the immediate neccesity of recruiting troops, an advisor has suggested we make some...exceptions to our recitment standards. Couldn't a 17 year old fight and die for (country) just as well as an 18 year old? Surely a 45 year old still has enought youth left in him for one last charge? The people won't like it, but we need more bodies to fill in our ranks. Don't you agree?",
    :choices => {
      "Yes" => :conscrpition_en_masse,
      "No, we must draw the line"   => :nothing
    }
   },
   21 => {
     :message => "Our Most Glorious Leader! It seems that in order to defend their homes, many citiznes near the fighting have formed local militias which have become quite proficiant at basic combat. While these are supposed to be olny for the purpose of defense, I'm sure that with some...monetary compensation they could be convinced to join in the fighting. Let's say... 90,000 (currency). Do you think we need their help?",
    :choices => {
      "Yes" => :citizen_militias,
      "No, of course not"   => :nothing
    }
   },
   22 => {
     :message => "Our Most Glorious Leader! Throught out the war we have given some aid to those displaced and dispossessed by the war. However, in an effort to encourage citizens to join the army we could tie those benefits to army service. This could be considered 'extremely amoral' by the citizenry, as everything seems to be in this day and age. Let's no let that get in the way of neccesity, right?",
    :choices => {
      "Right" => :conscription_for_benefits,
      "Wrong"   => :nothing
    }
   },
  23 => {
    :message => "Our Most Glorious Leader! The day has come! The legions of (enemy_country) are making their charge! This battle will decide the fate of the war. Our armies are in position. This day will go down in history, one way or the other. I hope our actions have sucured victory.",
    :choices => {
      "we will hold" => :final_battle,
      "We'll spill the blood of our enemies this day" => :final_battle,
      "One day there will be peace" => :final_battle
    }
   },
  24 => {#If you have more than 7000 soldiers after event 23
     :message => "Our Most Glorious Leader! News from the front! Victory! Victory! The people rejoice in the streets! The war is won. Their surender will come shortly. One way or another, you did it. You are ahero to the people. There will be peace. Long live (ruler)! Long live (country)!",
    :choices => {
      "Esto Perpetua" => :victory
    }
   },
   25 => {
     :message => "Our Most Glorious Leader. The news from the front has arrived. The day is lost. The war is over. We cannot win. We have no choice but to surrender. The armies of (enemy_country) will wash over (country). For what its worth, you tried. I think that's worth something.",
    :choices => {
      "Capitulate" => :annexation
    }
   }
 }

$messages = {
  :over_spend => "You do not have the required funds!",
  :generous_donation => "Money for your government flows in.", #25,000 dollars
  :influx_of_recruits => "Citizens rush to join the army.", #250 troops
  :annexation => "You have been annexed by (enemy_country).", #you lose
  :declaration_of_war => "(enemy_country) has declared war on (country)! Our armies will destroy them on the field of battle.",
  :ally_aid => "Our longtime ally sends us money.", #gives 75,000 dollars
  :ally_declares => "Our longtime ally has joined us in war against (enemy_country)!", #allies comes into war
  :mobilize => "Our army is ready for combat!", #2000 troops
  :harsh_draft => "Our army size has increased, but the people are displeased.", #3000 troops, lose 20% approval
  :taxes => "We have more funds to work with, but the people are displeased.", #50,000 dollars, lose 20% approval
  :people_approve => "The people approve of your decision.", #gain 20 % approval
  :mercenaries => "We shall hire them at once!", #gain 1000 troops. lose 75000 dollars
  :nothing => "As you wish.",
  :small_bribe => "By liberal use of funds, the problem goes away.", #lose 10000 dollars
  :public_outrage => "The people are outraged by your decision! Public support for you wanes.", #lose 30% approval
  :troops_used_for_people => "The people are happy you are protecting their homes.", #gain 15% approval lose 500 troops
  :revolution => "Your rule is over. The people will have your head before long.", #game over
  :military_propaganda => "The campaign is a success and we see an increase in recruitment!", #gain 500 soldiers
  :helping_hungry => "It is impossible to relieve the famine for everyone, but what you did has made you a hero to the people.", #gain 40% opinion lose 40,000 money
  :people_starving => "The famine hits hard and the people blame you for it.", #lose 5,000 population and 10% oppinion
  :great_victory => "Hurray! We have lifted the siege! We have lost soldiers, but the people rejoice and praise your decision.", #lose 1,000 soldiers, gain 20% opinion,
  :city_holds =>"While it is a great expense, we are maintaining control of the city despite the siege.", #lose 30,000 dollars and 500 troops
  :city_lost => "We have lost the siege. Many citizens died when the barbaric soldiers of (enemy_country) entered the city and the people blame you for the loss.", # Lose 7,500 citizens and 20% opinion
  :desperate_measures => "Our plan has worked as expected. Our treasury grows fat on the loot of our conquest. The people grow resentful.", #gain 100,000 dollars lose 40% approval
  :daystobattle5 => "Preparations must begin now if we want to see victory.",
  :encouraged_recruitment => "Success! Increased recruitment bonuses have citizens banging at the doors of recruitment centers!", #lose 5000 dollars and gain 1000 recruits
  :good_recruitment => "We were sucessful at recruiting troops", #gain 500 troops
  :ally_supports => "Our army is bolstered with their strength", #gain 1000 troops
  :ally_mercenaries =>"Our army is bolster with their helo in aquiring mercenaries and our use of state funds", #gain 1000 soldiers lose 8000 dollars
  :conscription_en_masse => "The young and the old will adjust to the military lifestyle soon enought. Although they'd better do so quick, we've got a war to win! Their families will just have to get over it", #gain 1500 soldiers lose 30% opinion
  :conscription_for_benefits => "While these measures could be exetreme and absurd, they are obviously neccessary given the situation", #gain 1500 soldier lose 30% opinion
  :citizen_militias => "You know, I think to was Sun Tzu or someone like that who said that \"The best defense is a good offense\" So natrually these citizens are helping to defend their towns by joining the offensive. That's what we're telling them, at any rate.", #lose 90,000 dollars gain 1000 soldiers
  :final_battle => "News will come from the front soon. Remember, fortune favors the bold.",
  :victory => "May it be Perpetual. You win. Good job." #You Win!
}
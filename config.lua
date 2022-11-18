
globalConfig = {

  language = 'de', --change with 'en' for english, 'fr' for french, 'cz' for czech, 'de' for german
 

  props = { 
    


    {x = 0, y = 0, z = 0, model = 'prop_arm_wrestle_01'},
    {x = 0, y =0, z = 0, model = 'bkr_prop_clubhouse_arm_wrestle_01a'},
    {x = 0, y = 0, z = 0, model = 'bkr_prop_clubhouse_arm_wrestle_02a'},


  },

  showBlipOnMap = true, -- Set to true to show blip for each table

  blip = { --Blip info

    title="Armdrücken",  -- the name of the blip
    colour=0, -- Colour ID
    id=1 -- Blip ID

  }

}

text = { 
  ['en'] = {
    ['win'] = "You win !",
    ['lose'] = "You lost",
    ['full'] = "A wrestling match is already in progress",
    ['tuto'] = "To win, quickly press ",
    ['wait'] = "Waiting for an opponent",
  },
  ['fr'] = {
    ['win'] = "Vous avez gagné !",
    ['lose'] = "Vous avez perdu",
    ['full'] = "Un bras de fer est déjà en cours",
    ['tuto'] = "Pour gagner, appuyez rapidement sur ",
    ['wait'] = "En attente d'un adversaire",
  },
  ['cz'] = {
    ['win'] = "Vyhrál jsi !",
    ['lose'] = "Prohrál jsi",
    ['full'] = "Zápasový zápas již probíhá",
    ['tuto'] = "Chcete-li vyhrát, rychle stiskněte ",
    ['wait'] = "Čekání na protivníka",
  },
  ['de'] = {
    ['win'] = "Du hast gewonnen !",
    ['lose'] = "Du hast verloren",
    ['full'] = "Ein Wrestling Match ist bereits im Gange",
    ['tuto'] = "Um zu gewinnen, drücke schnell ",
    ['wait'] = "Warten auf einen Gegner",
  },

}
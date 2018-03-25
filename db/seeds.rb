# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroy all"
  MissionResource.destroy_all
  UserMission.destroy_all
  Mission.destroy_all
  Resource.destroy_all
  Kind.destroy_all
  User.destroy_all
  Country.destroy_all


puts "Creating Country "
  c = ["blue", "yellow", "pink", "red", "brown", "green"]
  # ISO3166::Country.all_translated.each { |country| Country.create(name: country, color: c.sample ) }
  france = Country.create!(name: "France", color: c.sample)
  spain = Country.create!(name: "Spain", color: c.sample)
  canada = Country.create!(name: "Canada", color: c.sample)

puts "Creating Kinds"
  k = Kind.create!(name: "Produits")
  producteur = Kind.create!(name: "Producteurs")
  fab = Kind.create!(name: "Méthode de Fabrication")
  recette = Kind.create!(name: "Recettes")

puts "Creating Users"
  s = User.create!(email: "jdupont@gmail.com", password: "azerty", first_name: "John", last_name: "Dupont", role: 2, country: france) #supervisor
  s1 = User.create!(email: "tdufour@gmail.com", password: "azerty", first_name: "Tom", last_name: "Dufour", role: 2, country: france) #supervisor
  u = User.create!(email: "esass@gmail.com", password: "azerty", first_name: "Edouard", last_name: "Sass", role: 1, country: canada) #coordinator
  u2 = User.create!(email: "mparent@gmail.com", password: "azerty", first_name: "Marcel", last_name: "Parent", role: 1, country: spain) #coordinateur
  index = 1

  user_call = RestClient.get('https://randomuser.me/api/?results=30&password=special,upper,lower,number&nat=us,dk,fr,es')
  parsed_user_call = JSON.parse(user_call, object_class: OpenStruct)
  user_data = parsed_user_call.results.each do |user|

    ambassador = User.new(email: "riberac#{index}@gmail.com", password: "azerty", first_name: user.name["first"], last_name: user.name["last"], role: 0, country:[france, canada, spain].sample, coordinator: [u, u2].sample, score: (1..10000).to_a.sample) #ambassadeur
    ambassador.remote_photo_url = user.picture["medium"]
    ambassador.save!
    print "👨‍"
    index += 1
  end

puts "Creating Resources"
  foie = "Le foie gras est un mets de fête populaire et bien connu dans la cuisine française. Il se consomme cru, mi-cuit ou cuit, et peut être proposé sous forme de produit frais ou en conserve, consommé seul ou en accompagnement d'autres plats comme une viande. Selon la loi française, le foie gras fait partie du patrimoine culturel et gastronomique protégé en France. On entend par foie gras, le foie d'un canard ou d'une oie spécialement engraissés par gavage."
  miel = "Le miel est une substance sucrée élaborée par les abeilles à miel à partir de nectar ou de miellat. Elles l'entreposent dans la ruche et s'en nourrissent tout au long de l'année, en particulier lors de périodes climatiques défavorables. Il est aussi consommé par d'autres espèces animales, dont l'espèce humaine qui organise sa production par l'élevage des abeilles à mie"
  r = Resource.create!(name: "Foie Gras", description: foie, supervisor: s, kind: k, remote_photo_url: "https://res.cloudinary.com/dl7gimh19/image/upload/v1521902763/foie_gras_groliere_1.jpg" )
  r1 = Resource.create!(name: "La Belaudie Havard Sarl", description: "Producteur de Foie Gras, Basé dans le pays ribéracois, La Bélaudie, 24600 Vanxains", supervisor: s, kind: producteur, remote_photo_url: "https://s3-eu-west-1.amazonaws.com/sc-files.pjms.fr/p/pjms/308/000/302/010/3815956c350e48c6bd3066b64f9d9a3d.jpg" )
  r2 = Resource.create!(name: "Anny France", description: "Producteur de Foie Gras, Basé dans le pays ribéracois, Route de Périgueux, 24600 Ribérac", supervisor: s, kind: producteur, remote_photo_url: "https://www.foiegras-annyfrance.fr/214-large/foie-gras-de-canard-entier-sterilise-conserve.jpg" )
  r3 = Resource.create!(name: "Foie Gras et magret en buisson ardent", description: "Sur le pourtour de l’assiette individuelle, placer la salade préalablement assaisonnée, poser une tranche de pain toasté au centre, y déposer une ou 2 tranches de Foie Gras.Agrémenter avec des petites brochettes sur lesquelles on aura alterné les tranches de magret avec les boules de melon, les pointes d’asperges, les grains de raisin et les fruits rouges.Parsemer de poivre mignonnette et saupoudrer très délicatement de piment d’Espelette.", supervisor: s, kind: recette, remote_photo_url: "http://lefoiegras.fr/uploads/recipe_picture_2015_11_19_17_51_39_483654-325x400.jpg" )
  r4 = Resource.create!(name: "Miel", description: miel, supervisor: s, kind: k, remote_photo_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/Runny_hunny.jpg/1024px-Runny_hunny.jpg" )
  r5 = Resource.create!(name: "Chocolaterie La Ruchette", description: "Apiculteur, Basé dans le pays ribéracois", supervisor: s, kind: producteur, remote_photo_url: "http://www.chocolaterie-laruchette.com/images/vitrine.jpg" )
  r6 = Resource.create!(name: "Yolaine et Thierry", description: "Apiculteur, Basé dans le pays ribéracois", supervisor: s, kind: producteur, remote_photo_url: "http://www.yolainethierry.fr/images/IMG_1341b.jpg" )
  r7 = Resource.create!(name: "Process de Fabrication du miel", description: "Vidéo explicative", supervisor: s, kind: producteur, video_url: "https://youtu.be/X3Ahiv2ZIL4?t=4" )

puts "Creating Mission"

  m = Mission.create!(name: "Présentation & Dégustation des produits", description: "Présentation via les fiches ressources des produits du pays Ribéracois", score: 100, remote_photo_url:"https://cdt14.media.tourinsoft.eu/upload/NDT-illustration-2.jpg", creator: u, lastest_date: DateTime.new(2018,06,15) )
  m2 = Mission.create!(name: "Cours de Cuisine", description: "Réalisation avec un chef local et les produits ribéracois d'un cours de cuisine", score: 300, remote_photo_url:"https://cache-graphicslib.viator.com/graphicslib/thumbs674x446/6554/SITours/cours-de-p-tisserie-et-de-desserts-fran-ais-l-atelier-des-chefs-in-paris-159191.jpg", creator: u, lastest_date: DateTime.new(2018,03,26) )
  m3 = Mission.create!(name: "Gestion des réseaux sociaux", description: "Communication sur les réseaux sociaux locaux des activités à venir, sur Gourming,...", score: 50, remote_photo_url:"https://sd-cdn.fr/wp-content/uploads/2018/01/reseaux-sociaux-770x515.jpg", creator: u2, lastest_date: DateTime.new(2018,12,31) )


puts "Creating Mission_Ressources"
  MissionResource.create!(mission: m, resource: r)
  MissionResource.create!(mission: m, resource: r1)
  MissionResource.create!(mission: m, resource: r2)
  MissionResource.create!(mission: m, resource: r4)
  MissionResource.create!(mission: m, resource: r5)
  MissionResource.create!(mission: m, resource: r7)
  MissionResource.create!(mission: m2, resource: r)
  MissionResource.create!(mission: m2, resource: r3)
  MissionResource.create!(mission: m2, resource: r4)
  MissionResource.create!(mission: m, resource: r6)
  MissionResource.create!(mission: m3, resource: r5)

puts "Creating User_Mission"
  ambassadors = User.ambassador
  ambassadors.each do |user|
    UserMission.create!(user: user, mission: [m, m2, m3].sample, date: DateTime.new(2018,02,20)).done!
    UserMission.create!(user: user, mission: [m, m2, m3].sample)
    UserMission.create!(user: user, mission: [m, m2, m3].sample, date: DateTime.new(2018,01,12)).done!
    UserMission.create!(user: user, mission: [m, m2, m3].sample, date: DateTime.new(2018,02,05)).done!
    UserMission.create!(user: user, mission: [m, m2, m3].sample, date: DateTime.new(2018,01,03)).done!
    UserMission.create!(user: user, mission: [m, m2, m3].sample)
end

puts "Creating Achievement"
  Achievement.create!(name:"Master Creative" , badge: "fab fa-angrycreative", description: "Cet ambassadeur a su développé le réseau via des initiatives créatives et ludiques", user: s, required: 100 )
  Achievement.create!(name:"Navigateur Extreme" , badge: "fab fa-avianex", description: "Cet ambassadeur a su parcourir sa région pour développer son réseau", user: s, required: 50 )
  Achievement.create!(name:"Cuisine Addict" , badge: "fas fa-birthday-cake", description: "Cet ambassadeur a su réalisé de nombreux cours de cuisine", user: s, required: 300 )
  Achievement.create!(name:"Organisateur Ultime" , badge: "fas fa-chess-knight", description: "Cet ambassadeur a organisé plus de 3 événements en 3 mois", user: s1, required: 400 )
  Achievement.create!(name:"Alumni Ruby" , badge: "far fa-gem", description: "Cet ambassadeur a organisé plus de 10 événements et représente un élément clé du réseau", user: s1, required: 500 )

puts "Finished"

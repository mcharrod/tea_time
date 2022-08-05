user1 = User.create!(first_name: "Billy", last_name: "Bob", email: "BillyBob@gmail", address: "123 sesame street")
user2 = User.create!(first_name: "Sally", last_name: "Sob", email: "SallyBob@gmail", address: "277 wallaby way sydney")
user3 = User.create!(first_name: "Molly", last_name: "Mob", email: "MollyBob@gmail", address: "22 jump street")

tea1 = Tea.create!(title: "jasmine tea", description: "relaxing", temperature: 210, brew_time: "5 minutes")
tea2 = Tea.create!(title: "oolong tea", description: "invogorating", temperature: 180, brew_time: "5 minutes")
tea3 = Tea.create!(title: "jade tea", description: "sparkly", temperature: 120, brew_time: "5 minutes")

subscription1 = Subscription.create!(tea_id: tea1.id, user_id: user1.id, title: "jasmine tea subscription box", frequency: 6, price: 5, status: "active")
subscription2 = Subscription.create!(tea_id: tea2.id, user_id: user1.id, title: "oolong tea subscription box", frequency: 6, price: 5, status: "active")
subscription3 = Subscription.create!(tea_id: tea3.id, user_id: user1.id, title: "jade tea subscription box", frequency: 6, price: 5, status: "active")



p1 = Person.new(name: 'Andy Bechtolsheim')
p1.save!

c1 = Organization.new(name: 'Google')
c1.save!

p2 = Person.new(name: 'Larry Page')
p2.save!

p2.join!(p1)

p1.invest!(c1, 100000)

c2 = Organization.new(name: 'Sequoia Capital')
c2.save!

c2.invest!(c1, 25000000)

c3 = Organization.new(name: 'Instagram')
c3.save!

c2.invest!(c3, 50000000)

c4 = Organization.new(name: 'Facebook')
c4.save!
c4.acquire!(c3, 1000000000)


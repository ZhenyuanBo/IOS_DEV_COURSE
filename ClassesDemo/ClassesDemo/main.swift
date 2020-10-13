let skeleton = Enemy()

print(skeleton.health)
skeleton.move()

skeleton.attack()

let dragon = Dragon()
dragon.wingSpan = 5
dragon.attackStrength = 15
dragon.talk(speech: "My text...")
dragon.move()
dragon.attack()

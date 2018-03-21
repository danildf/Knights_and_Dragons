ssystem('cls')

dragon={
	hp: 2000,
	defense: 130,
	str: 200,
	weapon: 0
}
	
hero={
	hp: 1350,
	defense: 100,
	str: 120,
	weapon: 150,
	shield: 150
}

hell_hound={
	hp: 750,
	defense: 50,
	str: 400,
	weapon: 0
}

spells={
	healing_spell: 400,
	damage_spell: 100,
	wind_spell: 0
}
weapons={
	hammer: 250,
	axe: 350
}

def input()
	print ">"
	string=gets.chomp
	return string
end

move=""
turn_counter=0
damage=0

bot_shield_enable=0
bot_firewall=0
bot_dodge=0

bot_healing_spell=3
bot_damage_spell=2
bot_wind_spell=2
bot_wind=0

bot_hammer=2
bot_axe=2
bot_ch_hammer=0
bot_ch_axe=0
bot_done=1

pl_shield_enable=0
pl_firewall=0
pl_dodge=0
	
pl_healing_spell=3
pl_damage_spell=2
pl_wind_spell=2
pl_wind=0

pl_hammer=2
pl_axe=2
pl_ch_hammer=0
pl_ch_axe=0
pl_done=1

bus=0

puts "Welcome my friend, to the one and only Dragons and Knights game(by fedyay)!!"
puts "ALL characters are balanced!"
puts "Please read EACH line carefuly, otherwise YOU ARE A *$#%#%& NOOB."
puts ""
puts "Choose playing mode.(single, 1v1)"
mode=input()

if mode=="single"
puts "\nYou will play with a super smart Bot."
puts "Choose your character: Knight(easy), Dragon(medium) or Hell Hound(hard)."
character=input()

puts ""
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts "Sats:"
case character
when "Knight"
	hero.each do |st, num|
		puts "#{st}=#{num}"
	end
	puts ""
	puts "Special ability is Shield(Blocks the ammount of damage that is equal to shield stat)."
	puts "Can apply different weapons for one turn."
	puts ""
	puts "Moves: attack, defend, equip, skip."
when "Dragon"
	dragon.each do |st, num|
		puts "#{st}=#{num}"
	end
	puts ""
	puts "Special ability is Firewall(Makes the Dragon invulnerable for one turn but takes 100 hp)."
	puts ""
	puts "Moves: attack, firewall, scale, skip."
when "Hell Hound"
	hell_hound.each do |st, num|
		puts "#{st}=#{num}"
	end
	puts ""
	puts "Special ability is Dodge(Hell Hound dodges next attack with no harm)."
	puts "Never misses. Has a 20% chance of 1.6 creet."
	puts ""
	puts "Moves: attack, dodge, skip."
end
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts ""

case character
when character="Knight"
	player=hero
when character="Dragon"
	player=dragon
when character="Hell Hound"
 player=hell_hound
end

pick=rand(1..2)
case player
when player=hero
	if pick==1
		bot=dragon
	else
		bot=hell_hound
	end
when player=dragon
	if pick==1
		bot=hero
	else
		bot=hell_hound
	end
when player=hell_hound
if pick==1
		bot=dragon
	else
		bot=hero
	end
end

case bot
when bot=dragon
	bot_name="Dragon"
when bot=hero
	bot_name="Knight"
when bot=hell_hound
	bot_name="Hell Hound"
end

puts "======================================"
puts "#{character}: I will kill you SON OF A PUNK!"
puts "#{bot_name}: AAARGH!"
puts "======================================"
puts ""

loop do	
	pl_shield_enable=0	
	pl_dodge=0	
	pl_firewall=0
	pl_wind=0
	turn_counter+=1
	puts "Turn number #{turn_counter}"	
		puts "Do you want to apply any spels?(yes, no)"
		puts "You have #{pl_healing_spell} healing spell(s), #{pl_damage_spell} damage spell(s) and #{pl_wind_spell} wind spell(s)."
		if_spel=input()		
		if if_spel=="yes"
			puts "What spell do you want to apply?(healing, damage, wind)"
			what_spell=input()
			if what_spell=="healing"
				if pl_healing_spell==0
					puts "No healing spells left."
				else
					player[:hp]=player[:hp]+spells[:healing_spell]
					puts "Applied successfuly. Now your HP is #{player[:hp]}."
					pl_healing_spell+=(-1)
				end
			elsif what_spell=="damage"
				if pl_damage_spell==0
					puts "No damage spells left."
				else
					bot[:hp]=bot[:hp]-spells[:damage_spell]
					puts "Your enemy now has #{bot[:hp]} HP."
					pl_damage_spell+=(-1)
				end
			else
				if pl_wind_spell==0
					puts "No wind spells left."
				else
					pl_wind=1
					puts "You will avoid next attack."
					pl_wind_spell+=(-1)
				end
			end
		else
		 puts "No spells were applied."
		end

	case player
	when player=hero
		
		if pl_done==1
			pl_ch_weapon=0
			pl_ch_hammer=0
			pl_ch_axe=0
		else
		end
		puts "Knight's turn. Choose your moove..."
		if pl_ch_hammer==1
			puts "ATTENTION you have a Hammer equiped!"
		elsif pl_ch_axe==1
			puts "ATTENTION you have an Axe equiped!"
		else
		end
		move=input()
		case move
		when "attack"
			pl_done=1
			if rand(1..4) < 3
				puts "Knight has GOT the #{bot_name}."
				if bot_wind==1
					damage=0					
				elsif bot_dodge==1
					damage=0					
				elsif bot_firewall==1
					damage=0					
				elsif pl_ch_hammer=1 && bot_shield_enable==1
					damage=player[:str]+player[:weapon]+weapons[:hammer]-bot[:defense]-bot[:shield]					
				elsif pl_ch_axe==1 && bot_shield_enable==1
					damage=player[:str]+player[:weapon]+weapons[:axe]-bot[:defense]-bot[:shield]					
				elsif pl_ch_hammer==1
					damage=player[:str]+player[:weapon]+weapons[:hammer]-bot[:defense]					
				elsif pl_ch_axe==1
					damage=player[:str]+player[:weapon]+weapons[:axe]-bot[:defense]					
				elsif bot_shield_enable==1
					damage=player[:str]+player[:weapon]-bot[:defense]-bot[:shield]					
				else
					damage=player[:str]+player[:weapon]-bot[:defense]					
				end
				if damage>=0
					bot[:hp]=bot[:hp]-damage
				else
				end
				puts "#{bot_name} has #{bot[:hp]} HP left."
				puts ""
				puts "============================"
				puts ""
			else
				puts "Knight missed..."
				
				puts ""
				puts "============================"
				puts ""
			end
	
		when "skip"
			puts "Knight has skipped his turn..."
			puts ""
			puts "============================"
			puts ""
			
		when "equip"
			if pl_done==0
				puts "You already have a weapon on you."
			else
				puts "What weapon do you want to equip?(hammer, axe)"
				puts "You have #{pl_hammer}(250dmg) hammer(s) and #{pl_axe}(350dmg) axe(s)."
				ch_weapon=input()
				if ch_weapon=="hammer"
					if pl_hammer>0
						pl_ch_hammer=1
						pl_hammer+=(-1)
						pl_ch_axe=0
						pl_done=0
						puts "Hammer has been equiped, you can use it when you are ready."
						puts ""
						puts "============================"
						puts ""
					else
						puts "No hammers left."
						puts ""
						puts "============================"
						puts ""
					end
				elsif ch_weapon=="axe"
					if pl_axe>0
						pl_ch_hammer=0
						pl_ch_axe=1
						pl_axe+=(-1)
						pl_done=0
						puts "Axe has been equiped, you can use it when you are ready."
						puts ""
						puts "============================"
						puts ""
					else
						puts "No axes left."
						puts ""
						puts "============================"
						puts ""
					end
				else
					puts "No weapon has been equiped."
					puts ""
					puts "============================"
					puts ""
				end
			end
			
		when "defend"
			puts "Knight defends."
			shield_enable=1
			puts ""
			puts "============================"
			puts ""
		end
	
	when player=dragon
	
		puts "Dragon's turn. Choose your moove..."	
		move=input()	
		case move
		when "attack"
			if rand(1..4) < 4
				puts "Dragon has GOT the #{bot_name}."
				if bot_wind==1
					damage=0					
				elsif bot_dodge==1
					damage=0					
				elsif bot_firewall==1
					damage=0					
				elsif pl_ch_hammer==1 && bot_shield_enable==1
					damage=player[:str]+player[:weapon]+weapons[:hammer]-bot[:defense]-bot[:shield]					
				elsif pl_ch_axe==1 && bot_shield_enable==1
					damage=player[:str]+player[:weapon]+weapons[:axe]-bot[:defense]-bot[:shield]					
				elsif pl_ch_hammer==1
					damage=player[:str]+player[:weapon]+weapons[:hammer]-bot[:defense]					
				elsif pl_ch_axe==1
					damage=player[:str]+player[:weapon]+weapons[:axe]-bot[:defense]					
				elsif bot_shield_enable==1
					damage=player[:str]+player[:weapon]-bot[:defense]-bot[:shield]					
				else
					damage=player[:str]+player[:weapon]-bot[:defense]					
				end
				if damage>=0
					bot[:hp]=bot[:hp]-damage
				else
				end				
				puts "#{bot_name} has #{bot[:hp]} HP left."
				puts ""
				puts "============================"
				puts ""
			else
				puts "Dragon missed..."				
				puts ""
				puts "============================"
				puts ""
			end
		
		when "firewall"
			puts "Dragon makes a Firewall, he gets 100 damage and invulnerability for next turn."
			player[:hp]=player[:hp]-100
			pl_firewall=1
			puts ""
			puts "============================"
			puts ""
			
		when "scale"
			if player[:defense]<250
				player[:defense]=player[:defense]+30
				puts "Your defense has grown by 30."
				puts ""
				puts "============================"
				puts ""
			else
				puts "Your scale can't grow stronger."
				puts ""
				puts "============================"
				puts ""
			end
			
		when "skip"
			puts "Dragon has skipped his turn..."
			puts ""
			puts "============================"
			puts ""
		end
		
	when player=hell_hound
	
		puts "Hell Hound's turn. Choose your moove..."	
		move=input()	
		case move
		when "attack"
				puts "Hell Hound has GOT the #{bot_name}."
				if bot_wind==1
					damage=0
				elsif bot_dodge==1
					damage=0
				elsif bot_firewall==1
					damage=0
				elsif pl_ch_hammer==1 && bot_shield_enable==1
					damage=player[:str]+player[:weapon]+weapons[:hammer]-bot[:defense]-bot[:shield]
				elsif pl_ch_axe==1 && bot_shield_enable==1
					damage=player[:str]+player[:weapon]+weapons[:axe]-bot[:defense]-bot[:shield]
				elsif pl_ch_hammer==1
					damage=player[:str]+player[:weapon]+weapons[:hammer]-bot[:defense]
				elsif pl_ch_axe==1
					damage=player[:str]+player[:weapon]+weapons[:axe]-bot[:defense]
				elsif bot_shield_enable==1
					damage=player[:str]+player[:weapon]-bot[:defense]-bot[:shield]
				else
					damage=player[:str]+player[:weapon]-bot[:defense]
				end
				if rand(1..5)>3
					extrad=(damage*1.6).to_i
					if damage>=0
						bot[:hp]=bot[:hp]-extrad
						puts "Hell Hound makes a critical hit!"
					else
					end
				else
					if damage>=0
						bot[:hp]=bot[:hp]-damage
					else
					end
				end			
				puts "#{bot_name} has #{bot[:hp]} HP left."
				puts ""
				puts "============================"
				puts ""
			
		when "skip"			
			puts "Hell Hound has skipped his turn..."
			puts ""
			puts "============================"
			puts ""
			
		when "dodge"
			pl_dodge=1
			puts "Hell Hound will dodge any next attack."
			puts ""
			puts "============================"
			puts ""
		end
	end
	
	if bot[:hp]<=0
		puts "#{bot_name} has been defeated!"
		puts "#{character} wins the battle!"
		puts ""
		puts "============================"
		break
	end
	
	turn_counter+=1
	puts "Turn number #{turn_counter}"

	bot_firewall=0
	bot_dodge=0
	bot_shield_enable=0
	bot_wind=0
	bothp=bot[:hp]
	plhp=player[:hp]
	bus=0
	
	case bot
	when bot=hero
	
		if bot_done==1
			bot_ch_axe=0
			bot_ch_hammer=0
		else
		end
	
		if bothp<500 && bot_healing_spell>0
			bot[:hp]=bot[:hp]+spells[:healing_spell]
			puts "Your enemy has applied a healing spell, now he has #{bot[:hp]} HP."
			bot_healing_spell+=(-1)
			bus=1
		else
		end
		
		if rand(0..100)>85 && bot_damage_spell>0 && bus==0
			player[:hp]=player[:hp]-spells[:damage_spell]
			puts "Your enemy has applied a damage spell, now you have #{player[:hp]} HP."
			bot_damage_spell+=(-1)
			bus=1
		end
		
		bot_num=rand(0..100)
		puts "Knight's turn."
		
		if plhp>500 && bot_hammer>0 && rand(1..100)>80 && bot_ch_axe==0
			puts "Your enemy has equiped a Hammer!"
			bot_ch_hammer=1
			bot_hammer+=(-1)
			bot_done=0
			puts ""
			puts "============================"
			puts ""
		
		elsif plhp>500 && bot_axe>0 && rand(1..100)>70 && bot_ch_hammer==0
			puts "Your enemy has equiped an Axe!"
			bot_ch_axe=1
			bot_axe+=(-1)
			bot_done=0
			puts ""
			puts "============================"
			puts ""
		
		elsif bot_num<80 && pl_wind==0
			bot_done=1
			if rand(1..4) < 4 
				puts "Knight has GOT the Dragon."
				if rand(0..100)>95
					puts "Your enemy has applied a wind spell, he is immune to damage for one turn."
					bot_wind=1
					bot_wind_spell+=(-1)
				end
				if pl_wind==1
					damage=0
				elsif pl_dodge==1
					damage=0
				elsif pl_firewall==1
					damage=0
				elsif bot_ch_hammer==1 && pl_shield_enable==1
					damage=bot[:str]+bot[:weapon]+weapons[:hammer]-player[:defense]-player[:shield]
				elsif bot_ch_axe==1 && pl_shield_enable==1
					damage=bot[:str]+bot[:weapon]+weapons[:axe]-bot[:defense]-player[:shield]
				elsif bot_ch_hammer==1
					damage=bot[:str]+bot[:weapon]+weapons[:hammer]-player[:defense]
				elsif bot_ch_axe==1
					damage=bot[:str]+bot[:weapon]+weapons[:axe]-player[:defense]
				elsif pl_shield_enable==1
					damage=bot[:str]+bot[:weapon]-bot[:defense]-bot[:shield]
				else
					damage=bot[:str]+bot[:weapon]-player[:defense]
				end
				if damage>=0
					player[:hp]=player[:hp]-damage
				else
				end
				puts "#{character} has #{player[:hp]} HP left."
				puts ""
				puts "============================"
				puts ""
			else
				puts "Knight missed..."				
				puts ""
				puts "============================"
				puts ""
			end

		else			
				puts "Knight defends."
				shield_enable=1
				puts ""
				puts "============================"
				puts ""
		end

	
	when bot=dragon
	
		if bothp<700 && bot_healing_spell>0
			bot[:hp]=bot[:hp]+spells[:healing_spell]
			puts "Your enemy has applied a healing spell, now he has #{bot[:hp]} HP."
			bot_healing_spell+=(-1)
			bus=1
		else
		end
		
		if rand(0..100)>85 && bot_damage_spell>0 && bus==0
			player[:hp]=player[:hp]-spells[:damage_spell]
			puts "Your enemy has applied a damage spell, now you have #{player[:hp]} HP."
			bot_damage_spell+=(-1)
			bus=1
		end
	
		bot_num=rand(0..100)
		puts "Dragon's turn."
		
		if bot_num<80 && pl_wind==0
			if rand(1..4) < 4
				puts "Dragon has GOT the #{character}."
				if pl_wind==1
					damage=0
				elsif pl_dodge==1
					damage=0
				elsif pl_firewall==1
					damage=0
				elsif bot_ch_hammer==1 && pl_shield_enable==1
					damage=bot[:str]+bot[:weapon]+weapons[:hammer]-player[:defense]-player[:shield]
				elsif bot_ch_axe==1 && pl_shield_enable==1
					damage=bot[:str]+bot[:weapon]+weapons[:axe]-bot[:defense]-player[:shield]
				elsif bot_ch_hammer==1
					damage=bot[:str]+bot[:weapon]+weapons[:hammer]-player[:defense]
				elsif bot_ch_axe==1
					damage=bot[:str]+bot[:weapon]+weapons[:axe]-player[:defense]
				elsif pl_shield_enable==1
					damage=bot[:str]+bot[:weapon]-bot[:defense]-bot[:shield]
				else
					damage=bot[:str]+bot[:weapon]-player[:defense]
				end
				if damage>=0
					player[:hp]=player[:hp]-damage
				else
				end
				puts "#{character} has #{player[:hp]} HP left."
				puts ""
				puts "============================"
				puts ""
			else
				puts "Dragon missed..."
				puts ""
				puts "============================"
				puts ""
			end
			
		elsif bot_num>90 || pl_wind==1
			if bot[:defense]<250
				player[:defense]=player[:defense]+30
				puts "Your enemie's defense has grown by 30."
				puts ""
				puts "============================"
				puts ""
			else
			end
			
		else
			if bot[:hp]>=200
				puts "Dragon makes a Firewall, he gets 100 damage and invulnerability for next turn."
				bot[:hp]=bot[:hp]-100
				pl_firewall=1
				puts ""
				puts "============================"
				puts ""
			else
				if rand(1..4) < 4
					puts "Dragon has GOT the #{character}."
					if pl_wind==1
						damage=0
					elsif pl_dodge==1
						damage=0
					elsif pl_firewall==1
						damage=0
					elsif bot_ch_hammer==1 && pl_shield_enable==1
						damage=bot[:str]+bot[:weapon]+weapons[:hammer]-player[:defense]-player[:shield]
					elsif bot_ch_axe==1 && pl_shield_enable==1
						damage=bot[:str]+bot[:weapon]+weapons[:axe]-bot[:defense]-player[:shield]
					elsif bot_ch_hammer==1
						damage=bot[:str]+bot[:weapon]+weapons[:hammer]-player[:defense]
					elsif bot_ch_axe==1
						damage=bot[:str]+bot[:weapon]+weapons[:axe]-player[:defense]
					elsif pl_shield_enable==1
						damage=bot[:str]+bot[:weapon]-bot[:defense]-bot[:shield]
					else
						damage=bot[:str]+bot[:weapon]-player[:defense]
					end
					if damage>=0
						player[:hp]=player[:hp]-damage
					else
					end
					puts "#{character} has #{player[:hp]} HP left."
					puts ""
					puts "============================"
					puts ""
				else
					puts "Dragon missed..."
					puts ""
					puts "============================"
					puts ""
				end
			end
		end
	
	when bot=hell_hound
	
		if bothp<=300 && bot_healing_spell>0
			bot[:hp]=bot[:hp]+spells[:healing_spell]
			puts "Your enemy has applied a healing spell, now he has #{bot[:hp]} HP."
			bot_healing_spell+=(-1)
			bus=1
		else
		end
		
		if rand(0..100)>85 && bot_damage_spell>0 && bus==0
			player[:hp]=player[:hp]-spells[:damage_spell]
			puts "Your enemy has applied a damage spell, now you have #{player[:hp]} HP."
			bot_damage_spell+=(-1)
			bus=1
		end
	
		bot_num=rand(0..100)
		puts "Hell Hound's turn."
		
		if bot_num<35 && pl_wind==0
			puts "Hell Hound has GOT the #{character}."
			if pl_wind==1
				damage=0
			elsif pl_dodge==1
				damage=0
			elsif pl_firewall==1
				damage=0
			elsif bot_ch_hammer==1 && pl_shield_enable==1
				damage=bot[:str]+bot[:weapon]+weapons[:hammer]-player[:defense]-player[:shield]
			elsif bot_ch_axe==1 && pl_shield_enable==1
				damage=bot[:str]+bot[:weapon]+weapons[:axe]-bot[:defense]-player[:shield]
			elsif bot_ch_hammer==1
				damage=bot[:str]+bot[:weapon]+weapons[:hammer]-player[:defense]
			elsif bot_ch_axe==1
				damage=bot[:str]+bot[:weapon]+weapons[:axe]-player[:defense]
			elsif pl_shield_enable==1
				damage=bot[:str]+bot[:weapon]-bot[:defense]-bot[:shield]
			else
				damage=bot[:str]+bot[:weapon]-player[:defense]
			end
			if rand(1..5)>3
				extrad=(damage*1.6).to_i
				puts "Hell Hound makes a critical hit!"
				if damage>=0
					player[:hp]=player[:hp]-extrad
				else
				end
			else
				if damage>=0
					player[:hp]=player[:hp]-damage
				else
				end
			end
			puts "#{character} has #{player[:hp]} HP left."
			puts ""
			puts "============================"
			puts ""			
		else			
			bot_dodge=1
			puts "Hell Hound will dodge any next attack."
			puts ""
			puts "============================"
			puts ""
		end
		
	end
		
	if player[:hp]<=0
		puts "#{character} has been defeated!"
		puts "#{bot_name} wins the battle!"
		puts ""
		puts "============================"
		break
	end
	
end


elsif mode=="1v1"
	puts ""
	puts "This is versus mod (you can play it with your mum)."
	puts ""
	puts "Player1, choose your character: Knight(easy), Dragon(medium) or Hell Hound(hard)."
character=input()
puts ""
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts "Sats:"
case character
when "Knight"
	hero.each do |st, num|
		puts "#{st}=#{num}"
	end
	puts ""
	puts "Special ability is Shield(Blocks the ammount of damage that is equal to shield stat)."
	puts "Can apply different weapons for one turn."
	puts ""
	puts "Moves: attack, defend, equip, skip."
when "Dragon"
	dragon.each do |st, num|
		puts "#{st}=#{num}"
	end
	puts ""
	puts "Special ability is Firewall(Makes the Dragon invulnerable for one turn but takes 100 hp)."
	puts ""
	puts "Moves: attack, firewall, skip."
when "Hell Hound"
	hell_hound.each do |st, num|
		puts "#{st}=#{num}"
	end
	puts ""
	puts "Special ability is Dodge(Hell Hound dodges next attack with no harm)."
	puts "Never misses."
	puts ""
	puts "Moves: attack, dodge, skip."
end
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts ""

case character
when character="Knight"
	player=hero
when character="Dragon"
	player=dragon
when character="Hell Hound"
 player=hell_hound
end
puts "Player2, choose your character: Knight(easy), Dragon(medium) or Hell Hound(hard)."
bot_name=input()

puts ""
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts "Sats:"
case bot_name
when "Knight"
	hero.each do |st, num|
		puts "#{st}=#{num}"
	end
	puts ""
	puts "Special ability is Shield(Blocks the ammount of damage that is equal to shield stat)."
	puts "Can apply different weapons for one turn."
	puts ""
	puts "Moves: attack, defend, equip, skip."
when "Dragon"
	dragon.each do |st, num|
		puts "#{st}=#{num}"
	end
	puts ""
	puts "Special ability is Firewall(Makes the Dragon invulnerable for one turn but takes 100 hp)."
	puts ""
	puts "Moves: attack, firewall, skip."
when "Hell Hound"
	hell_hound.each do |st, num|
		puts "#{st}=#{num}"
	end
	puts ""
	puts "Special ability is Dodge(Hell Hound dodges next attack with no harm)."
	puts "Never misses. Has a 20% chance of 1.6 creet."
	puts ""
	puts "Moves: attack, dodge, skip."
end
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts ""

case bot_name
when bot_name="Knight"
	bot=hero
when bot_name="Dragon"
	bot=dragon
when bot_name="Hell Hound"
 bot=hell_hound
end

	puts "======================================"
	puts "#{character}: I will kill you SON OF A PUNK!"
	puts "#{bot_name}: AAARGH!"
	puts "======================================"
	puts ""

loop do	
	pl_shield_enable=0	
	pl_dodge=0	
	pl_firewall=0
	pl_wind=0
	turn_counter+=1
	puts "Player1 turn(#{turn_counter})"	
		puts "Do you want to apply any spels?(yes, no)"
		puts "You have #{pl_healing_spell} healing spell(s), #{pl_damage_spell} damage spell(s) and #{pl_wind_spell} wind spell(s)."
		if_spel=input()		
		if if_spel=="yes"
			puts "What spell do you want to apply?(healing, damage, wind)"
			what_spell=input()
			if what_spell=="healing"
				if pl_healing_spell==0
					puts "No healing spells left."
				else
					player[:hp]=player[:hp]+spells[:healing_spell]
					puts "Applied successfuly. Now your HP is #{player[:hp]}."
					pl_healing_spell+=(-1)
				end
			elsif what_spell=="damage"
				if pl_damage_spell==0
					puts "No damage spells left."
				else
					bot[:hp]=bot[:hp]-spells[:damage_spell]
					puts "Your enemy now has #{bot[:hp]} HP."
					pl_damage_spell+=(-1)
				end
			else
				if pl_wind_spell==0
					puts "No wind spells left."
				else
					pl_wind=1
					puts "You will avoid next attack."
					pl_wind_spell+=(-1)
				end
			end
		else
		 puts "No spells were applied."
		end

	case player
	when player=hero
		
		if pl_done==1
			pl_ch_weapon=0
			pl_ch_hammer=0
			pl_ch_axe=0
		else
		end
		puts "Knight's turn. Choose your moove..."
		if pl_ch_hammer==1
			puts "ATTENTION you have a Hammer equiped!"
		elsif pl_ch_axe==1
			puts "ATTENTION you have an Axe equiped!"
		else
		end
		move=input()
		case move
		when "attack"
			pl_done=1
			if rand(1..4) < 4
				puts "Knight has GOT the #{bot_name}."
				if bot_wind==1
					damage=0					
				elsif bot_dodge==1
					damage=0					
				elsif bot_firewall==1
					damage=0					
				elsif pl_ch_hammer=1 && bot_shield_enable==1
					damage=player[:str]+player[:weapon]+weapons[:hammer]-bot[:defense]-bot[:shield]					
				elsif pl_ch_axe==1 && bot_shield_enable==1
					damage=player[:str]+player[:weapon]+weapons[:axe]-bot[:defense]-bot[:shield]					
				elsif pl_ch_hammer==1
					damage=player[:str]+player[:weapon]+weapons[:hammer]-bot[:defense]					
				elsif pl_ch_axe==1
					damage=player[:str]+player[:weapon]+weapons[:axe]-bot[:defense]					
				elsif bot_shield_enable==1
					damage=player[:str]+player[:weapon]-bot[:defense]-bot[:shield]					
				else
					damage=player[:str]+player[:weapon]-bot[:defense]					
				end
				if damage>=0
					bot[:hp]=bot[:hp]-damage
				else
				end
				
				puts "#{bot_name} has #{bot[:hp]} HP left."
				puts ""
				puts "============================"
				puts ""
			else
				puts "Knight missed..."
				
				puts ""
				puts "============================"
				puts ""
			end
	
		when "skip"
			puts "Knight has skipped his turn..."
			puts ""
			puts "============================"
			puts ""
			
		when "equip"
			if pl_done==0
				puts "You already have a weapon on you."
			else
				puts "What weapon do you want to equip?(hammer, axe)"
				puts "You have #{pl_hammer}(250dmg) hammer(s) and #{pl_axe}(350dmg) axe(s)."
				ch_weapon=input()
				if ch_weapon=="hammer"
					if pl_hammer>0
						pl_ch_hammer=1
						pl_hammer+=(-1)
						pl_ch_axe=0
						pl_done=0
						puts "Hammer has been equiped, you can use it when you are ready."
						puts ""
						puts "============================"
						puts ""
					else
						puts "No hammers left."
						puts ""
						puts "============================"
						puts ""
					end
				elsif ch_weapon=="axe"
					if pl_axe>0
						pl_ch_hammer=0
						pl_ch_axe=1
						pl_axe+=(-1)
						pl_done=0
						puts "Axe has been equiped, you can use it when you are ready."
						puts ""
						puts "============================"
						puts ""
					else
						puts "No axes left."
						puts ""
						puts "============================"
						puts ""
					end
				else
					puts "No weapon has been equiped."
					puts ""
					puts "============================"
					puts ""
				end
			end
			
		when "defend"
			puts "Knight defends."
			shield_enable=1
			puts ""
			puts "============================"
			puts ""
		end
	
	when player=dragon
	
		puts "Dragon's turn. Choose your moove..."	
		move=input()	
		case move
		when "attack"
			if rand(1..4) < 4
				puts "Dragon has GOT the #{bot_name}."
				if bot_wind==1
					damage=0					
				elsif bot_dodge==1
					damage=0					
				elsif bot_firewall==1
					damage=0					
				elsif pl_ch_hammer==1 && bot_shield_enable==1
					damage=player[:str]+player[:weapon]+weapons[:hammer]-bot[:defense]-bot[:shield]					
				elsif pl_ch_axe==1 && bot_shield_enable==1
					damage=player[:str]+player[:weapon]+weapons[:axe]-bot[:defense]-bot[:shield]					
				elsif pl_ch_hammer==1
					damage=player[:str]+player[:weapon]+weapons[:hammer]-bot[:defense]					
				elsif pl_ch_axe==1
					damage=player[:str]+player[:weapon]+weapons[:axe]-bot[:defense]					
				elsif bot_shield_enable==1
					damage=player[:str]+player[:weapon]-bot[:defense]-bot[:shield]					
				else
					damage=player[:str]+player[:weapon]-bot[:defense]					
				end
				if damage>=0
					bot[:hp]=bot[:hp]-damage
				else
				end				
				puts "#{bot_name} has #{bot[:hp]} HP left."
				puts ""
				puts "============================"
				puts ""
			else
				puts "Dragon missed..."				
				puts ""
				puts "============================"
				puts ""
			end
		
		when "firewall"
			puts "Dragon makes a Firewall, he gets 100 damage and invulnerability for next turn."
			player[:hp]=player[:hp]-100
			pl_firewall=1
			puts ""
			puts "============================"
			puts ""
			
		when "scale"
			if player[:defense]<250
				player[:defense]=player[:defense]+30
				puts "Your defense has grown by 30."
				puts ""
				puts "============================"
				puts ""
			else
				puts "Your scale can't grow stronger."
				puts ""
				puts "============================"
				puts ""
			end
			
		when "skip"
			puts "Dragon has skipped his turn..."
			puts ""
			puts "============================"
			puts ""
		end
		
	when player=hell_hound
	
		puts "Hell Hound's turn. Choose your moove..."	
		move=input()	
		case move
		when "attack"
				puts "Hell Hound has GOT the #{bot_name}."
				if bot_wind==1
					damage=0
				elsif bot_dodge==1
					damage=0
				elsif bot_firewall==1
					damage=0
				elsif pl_ch_hammer==1 && bot_shield_enable==1
					damage=player[:str]+player[:weapon]+weapons[:hammer]-bot[:defense]-bot[:shield]
				elsif pl_ch_axe==1 && bot_shield_enable==1
					damage=player[:str]+player[:weapon]+weapons[:axe]-bot[:defense]-bot[:shield]
				elsif pl_ch_hammer==1
					damage=player[:str]+player[:weapon]+weapons[:hammer]-bot[:defense]
				elsif pl_ch_axe==1
					damage=player[:str]+player[:weapon]+weapons[:axe]-bot[:defense]
				elsif bot_shield_enable==1
					damage=player[:str]+player[:weapon]-bot[:defense]-bot[:shield]
				else
					damage=player[:str]+player[:weapon]-bot[:defense]
				end
				if rand(1..5)>3
					extrad=(damage*1.6).to_i
					puts "Hell Hound makes a critical hit!"
					if damage>=0
						bot[:hp]=bot[:hp]-extrad
					else
					end
				else
					if damage>=0
						bot[:hp]=bot[:hp]-damage
					else
					end
				end			
				puts "#{bot_name} has #{bot[:hp]} HP left."
				puts ""
				puts "============================"
				puts ""
			
		when "skip"			
			puts "Hell Hound has skipped his turn..."
			puts ""
			puts "============================"
			puts ""
			
		when "dodge"
			pl_dodge=1
			puts "Hell Hound will dodge any next attack."
			puts ""
			puts "============================"
			puts ""
		end
	end
	
	if bot[:hp]<=0
		puts "#{bot_name} has been defeated!"
		puts "#{character} wins the battle!"
		puts ""
		puts "============================"
		break
	end

		turn_counter+=1
	puts "Player2 turn(#{turn_counter})"	

	bot_firewall=0
	bot_dodge=0
	bot_shield_enable=0
	bot_wind=0
	bothp=bot[:hp]
	plhp=player[:hp]
	
		puts "Turn number #{turn_counter}"	
		puts "Do you want to apboty any spels?(yes, no)"
		puts "You have #{bot_healing_spell} healing spell(s), #{bot_damage_spell} damage spell(s) and #{bot_wind_spell} wind spell(s)."
		if_spel=input()		
		if if_spel=="yes"
			puts "What spell do you want to apboty?(healing, damage, wind)"
			what_spell=input()
			if what_spell=="healing"
				if bot_healing_spell==0
					puts "No healing spells left."
				else
					bot[:hp]=bot[:hp]+spells[:healing_spell]
					puts "Apbotied successfuly. Now your HP is #{bot[:hp]}."
					bot_healing_spell+=(-1)
				end
			elsif what_spell=="damage"
				if bot_damage_spell==0
					puts "No damage spells left."
				else
					player[:hp]=player[:hp]-spells[:damage_spell]
					puts "Your enemy now has #{player[:hp]} HP."
					bot_damage_spell+=(-1)
				end
			else
				if bot_wind_spell==0
					puts "No wind spells left."
				else
					bot_wind=1
					puts "You will avoid next attack."
					bot_wind_spell+=(-1)
				end
			end
		else
		 puts "No spells were apbotied."
		end

	case bot
	when bot=hero
		
		if bot_done==1
			bot_ch_weapon=0
		else
		end
		puts "Knight's turn. Choose your moove..."
		if bot_ch_hammer==1
			puts "ATTENTION you have a Hammer equiped!"
		elsif bot_ch_axe==1
			puts "ATTENTION you have an Axe equiped!"
		else
		end
		move=input()
		case move
		when "attack"
			bot_done=1
			if rand(1..4) < 4
				puts "Knight has GOT the #{character}."
				if pl_wind==1
					damage=0					
				elsif pl_dodge==1
					damage=0					
				elsif pl_firewall==1
					damage=0					
				elsif bot_ch_hammer=1 && pl_shield_enable==1
					damage=bot[:str]+bot[:weapon]+weapons[:hammer]-player[:defense]-player[:shield]					
				elsif bot_ch_axe==1 && bot_shield_enable==1
					damage=bot[:str]+bot[:weapon]+weapons[:axe]-player[:defense]-player[:shield]					
				elsif bot_ch_hammer==1
					damage=bot[:str]+bot[:weapon]+weapons[:hammer]-player[:defense]					
				elsif bot_ch_axe==1
					damage=bot[:str]+bot[:weapon]+weapons[:axe]-player[:defense]					
				elsif bot_shield_enable==1
					damage=bot[:str]+bot[:weapon]-player[:defense]-player[:shield]					
				else
					damage=bot[:str]+bot[:weapon]-player[:defense]					
				end
				if damage>=0
					player[:hp]=player[:hp]-damage
				else
				end
				
				puts "#{bot_name} has #{player[:hp]} HP left."
				puts ""
				puts "============================"
				puts ""
			else
				puts "Knight missed..."
				
				puts ""
				puts "============================"
				puts ""
			end
	
		when "skip"
			puts "Knight has skipped his turn..."
			puts ""
			puts "============================"
			puts ""
			
		when "equip"
			if bot_done==0
				puts "You already have a weapon on you."
			else
				puts "What weapon do you want to equip?(hammer, axe)"
				puts "You have #{bot_hammer}(250dmg) hammer(s) and #{bot_axe}(350dmg) axe(s)."
				ch_weapon=input()
				if ch_weapon=="hammer"
					if bot_hammer>0
						bot_ch_hammer=1
						bot_hammer+=(-1)
						bot_ch_axe=0
						bot_done=0
						puts "Hammer has been equiped, you can use it when you are ready."
						puts ""
						puts "============================"
						puts ""
					else
						puts "No hammers left."
						puts ""
						puts "============================"
						puts ""
					end
				elsif ch_weapon=="axe"
					if bot_axe>0
						bot_ch_hammer=0
						bot_ch_axe=1
						bot_axe+=(-1)
						bot_done=0
						puts "Axe has been equiped, you can use it when you are ready."
						puts ""
						puts "============================"
						puts ""
					else
						puts "No axes left."
						puts ""
						puts "============================"
						puts ""
					end
				else
					puts "No weapon has been equiped."
					puts ""
					puts "============================"
					puts ""
				end
			end
			
		when "defend"
			puts "Knight defends."
			bot_shield_enable=1
			puts ""
			puts "============================"
			puts ""
		end
	
	when bot=dragon
	
		puts "Dragon's turn. Choose your moove..."	
		move=input()	
		case move
		when "attack"
			if rand(1..4) < 4
				puts "Dragon has GOT the #{character}."
				if pl_wind==1
					damage=0					
				elsif pl_dodge==1
					damage=0					
				elsif pl_firewall==1
					damage=0					
				elsif bot_ch_hammer==1 && pl_shield_enable==1
					damage=bot[:str]+bot[:weapon]+weapons[:hammer]-player[:defense]-player[:shield]					
				elsif bot_ch_axe==1 && pl_shield_enable==1
					damage=bot[:str]+bot[:weapon]+weapons[:axe]-player[:defense]-player[:shield]					
				elsif bot_ch_hammer==1
					damage=bot[:str]+bot[:weapon]+weapons[:hammer]-player[:defense]					
				elsif bot_ch_axe==1
					damage=bot[:str]+bot[:weapon]+weapons[:axe]-player[:defense]					
				elsif bot_shield_enable==1
					damage=bot[:str]+bot[:weapon]-player[:defense]-player[:shield]					
				else
					damage=bot[:str]+bot[:weapon]-player[:defense]					
				end
				if damage>=0
					player[:hp]=player[:hp]-damage
				else
				end				
				puts "#{character} has #{player[:hp]} HP left."
				puts ""
				puts "============================"
				puts ""
			else
				puts "Dragon missed..."				
				puts ""
				puts "============================"
				puts ""
			end
		
		when "firewall"
			puts "Dragon makes a Firewall, he gets 100 damage and invulnerability for next turn."
			bot[:hp]=bot[:hp]-100
			bot_firewall=1
			puts ""
			puts "============================"
			puts ""
			
		when "scale"
			if bot[:defense]<250
				bot[:defense]=bot[:defense]+30
				puts "Your defense has grown by 30."
				puts ""
				puts "============================"
				puts ""
			else
				puts "Your scale can't grow stronger."
				puts ""
				puts "============================"
				puts ""
			end
			
		when "skip"
			puts "Dragon has skipped his turn..."
			puts ""
			puts "============================"
			puts ""
		end
		
	when bot=hell_hound
	
		puts "Hell Hound's turn. Choose your moove..."	
		move=input()	
		case move
		when "attack"
				puts "Hell Hound has GOT the #{character}."
				if pl_wind==1
					damage=0					
				elsif pl_dodge==1
					damage=0					
				elsif pl_firewall==1
					damage=0					
				elsif bot_ch_hammer==1 && pl_shield_enable==1
					damage=bot[:str]+bot[:weapon]+weapons[:hammer]-player[:defense]-player[:shield]					
				elsif bot_ch_axe==1 && pl_shield_enable==1
					damage=bot[:str]+bot[:weapon]+weapons[:axe]-player[:defense]-player[:shield]					
				elsif bot_ch_hammer==1
					damage=bot[:str]+bot[:weapon]+weapons[:hammer]-player[:defense]					
				elsif bot_ch_axe==1
					damage=bot[:str]+bot[:weapon]+weapons[:axe]-player[:defense]					
				elsif bot_shield_enable==1
					damage=bot[:str]+bot[:weapon]-player[:defense]-player[:shield]					
				else
					damage=bot[:str]+bot[:weapon]-player[:defense]					
				end
				if rand(1..5)>3
					extrad=(damage*1.6).to_i
					if damage>=0
						player[:hp]=player[:hp]-extrad
						puts "Hell Hound makes a critical hit!"
					else
					end
				else
					if damage>=0
						player[:hp]=player[:hp]-damage
					else
					end
				end
				puts "#{character} has #{player[:hp]} HP left."
				puts ""
				puts "============================"
				puts ""
			
		when "skip"			
			puts "Hell Hound has skipped his turn..."
			puts ""
			puts "============================"
			puts ""
			
		when "dodge"
			bot_dodge=1
			puts "Hell Hound will dodge any next attack."
			puts ""
			puts "============================"
			puts ""
		end
	end
	
	if player[:hp]<=0
		puts "#{character} has been defeated!"
		puts "#{bot_name} wins the battle!"
		puts ""
		puts "============================"
		break
	end
end
end
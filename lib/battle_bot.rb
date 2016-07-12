require_relative 'weapon'



#battle_bot.rb
class BattleBot
  attr_reader :name, :health, :enemies, :weapon

  @@count = 0

  def initialize(name)
    @name = name
    @health = 100
    @enemies = []
    @weapon = nil
    @dead = false
    
    @@count += 1
  end

  def self.count
    @@count
  end

  def attack(another_bot)
    raise ArgumentError if another_bot.class != BattleBot
    raise ArgumentError if another_bot == self
    raise ArgumentError if @weapon == nil

    another_bot.receive_attack_from(self)
  end

  def receive_attack_from(another_bot)
    raise ArgumentError if another_bot.class != BattleBot
    raise ArgumentError if another_bot == self
    raise ArgumentError if another_bot.weapon == nil

    take_damage(another_bot.weapon.damage)
    defend_against(another_bot)

    @enemies.push(another_bot) unless @enemies.include?(another_bot)
  end

  def defend_against(another_bot)
    return if dead? || !has_weapon?
    attack(another_bot)

  end

   def take_damage(damage)
    @@count -= 1
    if damage > @health
      @health = 0
      @dead = true
    else
      @health -= damage
    end
    @health
  end

  def dead?
    @dead
  end

  def has_weapon?
    !@weapon.nil?
  end

  def name=(str)
    raise NoMethodError, "no method"
  end

  def health=(str)
    raise NoMethodError, "no method"
  end

  def enemies=(str)
    raise NoMethodError, "no method"
  end

  def weapon=(str)
    raise NoMethodError, "no method"
  end

  def pick_up(a_weapon)
    raise ArgumentError unless a_weapon.class == Weapon
    raise ArgumentError if a_weapon.bot != nil
    if @weapon == nil
      @weapon = a_weapon
      @weapon.bot = self
      @weapon
    else
        nil
    end
  end

  def drop_weapon
    @weapon.bot = nil
    @weapon= nil
  end

  def heal 
      @health += 10 unless @health == 0 || (@health + 10) > 100
  end

  



end
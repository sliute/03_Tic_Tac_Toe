class Player
  attr_reader :name, :sign, :type

  def initialize(args)
    raise 'You must provide a single-character sign' if args.fetch(:sign) == "" || args.fetch(:sign).nil?
    raise 'Your sign should be just 1 character long' if args.fetch(:sign).length > 1
    raise 'You can only play as either human (h/H) or computer (c/C)' unless args.fetch(:type) =~ /[cChH]/
    args.fetch(:name) == "" || args.fetch(:name).nil? ? @name = "Anon" : @name = args.fetch(:name)
    @sign = args.fetch(:sign)
    @type = args.fetch(:type)
  end
end

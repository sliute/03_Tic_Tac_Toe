class Player
  attr_reader :name, :sign, :type

  def initialize(args)
    check_name(args)
    check_type(args)
    raise 'You must provide a single-character sign' if args.fetch(:sign) == "" || args.fetch(:sign).nil?
    raise 'Your sign should be just 1 character long' if args.fetch(:sign).length > 1
    @sign = args.fetch(:sign)
  end

  def check_name(args)
    args.fetch(:name) == "" || args.fetch(:name).nil? ? @name = "Anon" : @name = args.fetch(:name)
  end

  def check_type(args)
    raise 'You can only play as either human (h/H) or computer (c/C)' unless args.fetch(:type) =~ /[cChH]/
    @type = args.fetch(:type)
  end
end

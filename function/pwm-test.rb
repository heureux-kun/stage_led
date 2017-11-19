require 'wiringpi'

LED = 4

begin
  io = WiringPi::GPIO.new

  io.soft_pwm_create(LED, 0, 100)
  while true
    (0..100).each do |x|
      io.soft_pwm_write(LED, x)
      sleep(0.01)
    end
    (0..100).each do |x|
      io.soft_pwm_write(LED, (100 - x))
      sleep(0.01)
    end
  end
rescue Interrupt
  io.soft_pwm_write(LED, 0)
end
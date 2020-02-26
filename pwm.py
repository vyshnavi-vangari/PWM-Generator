import RPi.GPIO as GPIO         


GPIO.setmode(GPIO.BOARD)

GPIO.setup(12, GPIO.OUT)
GPIO.setup(15, GPIO.OUT)
GPIO.setup(16, GPIO.OUT)
GPIO.setup(35, GPIO.OUT)

GPIO.output(12, 1)
GPIO.output(15, 1)
GPIO.output(16, 0)
GPIO.output(35, 0)

GPIO.cleanup()

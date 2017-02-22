require "time"

def measure(times = 1, &prc)
  now = Time.now
    times.times { prc.call }
  (Time.now - now)/times 
end

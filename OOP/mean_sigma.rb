def mean_sigma (v)
  mean = 0.0
  for element in v do
    mean += element
  end
  mean /= v.size
  
  sd = 0.0
  for element in v do
    sd += (element - mean)**2
  end
  
  return mean, Math.sqrt(sd / v.size)
end

### sample execution ###
array = [9,2,5,4,12,7,8,11,9,3,7,4,12,5,4,10,9,6,9,4]
mean, stdev = mean_sigma(array)
puts "mean: \t#{mean}\nstdev:\t#{stdev}"

### sample output ###
# mean:   7.0
# stdev:  2.9832867780352594

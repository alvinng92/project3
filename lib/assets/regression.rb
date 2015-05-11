
=begin
Methods are linearregress, multipoly, expregress and logregress
All methods except multipoly return 2 variables and a variance,
so the call should be
(Acoeff, Bcoeff, variance) = linearregress(time[], datapoints[]) etc
multipoly returns (Coeff[], variance, degree) for the lowest variance polynomial up to 10 degrees. 
=end


=begin
The following file can perform linear, polynomial, logarithmic and exponential regression on an input CSV file of data.
Linear regression function is based off and credited to Ryan W. (2012) https://engineering.sharethrough.com/blog/2012/09/12/simple-linear-regression-using-ruby/
Polynomial regression function is from SWEN30016 Project1 - Getting to grips with Ruby.pdf 
Exponential and Logarithmic equations are from http://mathworld.wolfram.com/LeastSquaresFittingExponential.html and http://mathworld.wolfram.com/LeastSquaresFittingLogarithmic.html respectively.
=end

require 'csv'
require 'matrix'

#Mean method used for Linear regression
def mean(values)
    total = values.reduce(0) { |sum, x| x + sum }
    Float(total) / Float(values.length)
end

#Linear Regression method
def linearregress xs, ys
	totalvariance = 0.0
	x_mean = mean(xs)
	y_mean = mean(ys)
 	numerator = (0...xs.length).reduce(0) do |sum, i|
        sum + ((xs[i] - x_mean) * (ys[i] - y_mean))
    end
 
    	denominator = xs.reduce(0) do |sum, x|
    	sum + ((x - x_mean) ** 2)
    end
 
	slope = (numerator / denominator)
	y_intercept = mean(ys) - (slope * mean(xs))
z=0
while z<xs.count
totalvariance+= (ys[z]-(slope*xs[z]+y_intercept))**2
z+=1
end
	return slope.round(2), y_intercept.round(2), totalvariance.round(2)
end

#Polynomial Regression
def polyregress x_array, y_array, degree
	x_data = x_array.map { |x_i| (0..degree).map { |pow| (x_i**pow).to_f } }
	mx = Matrix[*x_data]
	my = Matrix.column_vector(y_array)
@coefficients = ((mx.t * mx).inv * mx.t * my).transpose.to_a[0]
coeffcopy = @coefficients

#Create a buffer zone in array so the variance equation does not use nil values for degrees up to 10
@coefficients << 0.0
@coefficients << 0.0
@coefficients << 0.0
@coefficients << 0.0
@coefficients << 0.0
@coefficients << 0.0
@coefficients << 0.0
@coefficients << 0.0
@coefficients << 0.0

z=0
totalvariance = 0.00
#this assumes, as well as the other regressions, that xarray.count is always equal to yarray.count.
while z<x_array.count
#This variance calculation is messy and inefficient, but it works. 
totalvariance+= (y_array[z] - (@coefficients[0].round(2)*(x_array[z]**0) + @coefficients[1].round(2)*(x_array[z]**1) + @coefficients[2].round(2)*(x_array[z]**2) + @coefficients[3].round(2)*(x_array[z]**3)+ @coefficients[4].round(2)*(x_array[z]**4)+ @coefficients[5].round(2)*(x_array[z]**5)+ @coefficients[6].round(2)*(x_array[z]**6)+ @coefficients[7].round(2)*(x_array[z]**7)+ @coefficients[8].round(2)*(x_array[z]**8)+ @coefficients[9].round(2)*(x_array[z]**9)+ @coefficients[10].round(2)*(x_array[z]**10)))**2
 z+=1
end
	return coeffcopy,totalvariance.round(2)
end

#multipoly performs polynomial regression from degrees 1 to 10 and return the degree and polynomial coefficients with the lowest variance
def multipoly(xarray,yarray)
	degree = 1
	lowestvar = -1.0
	lowestdegree = 10
	lowestcoeff = []
	while degree<10
		coeff,var = polyregress(xarray,yarray,degree)
		if lowestvar < 0
			lowestdegree = degree
 			lowestvar = var
			lowestcoeff = coeff
		elsif var < lowestvar
		lowestvar = var
		lowestcoeff  = coeff
		lowestdegree = degree
		end
		degree+=1
	end

	return lowestcoeff , lowestvar.round(2), lowestdegree
end

#Logarithmic Regression
def logregress xarray, yarray
	i=0
	n=xarray.count
	#d,e,f,g are the different sums to be used to find the a and b coefficients
	d,e,f,g =0.0,0.0,0.0,0.0

	begin

	
	while i<xarray.count
		d+=yarray[i]*Math.log(xarray[i])
		e+=yarray[i]
		f+=Math.log(xarray[i])
		g+=Math.log(xarray[i])*Math.log(xarray[i])
		i+=1
	end

		rescue
		puts "Cannot perform logarithmic regression on this data"
		return
	end
	
#a and b coefficients are calculated here
	b=((n*d)-(e*f))/((n*g)-(f*f))
	a=(e-(b*f))/n


	z=0
	totalvariance = 0.0
	while z<xarray.count
		totalvariance+= (yarray[z]-(b*Math.log(xarray[z])+a))**2
		z+=1
	end
	return b.round(2),a.round(2),totalvariance.round(2)
end


#Exponential Regression
def expregress x,y
	i=0
	n=x.count

#a to j are sums to be calculated that are used to find the coefficients
	a,b,c,d,e,f,g,h,j, totalvariance = 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,0.0,0.0,0.0,0.0

#this begin block will jump to rescue if an error is caught, which will happen if log(value) is outside of domain
	begin
	while i<x.count
		a+=(x[i]*x[i]*y[i])
		b+=y[i]*Math.log(y[i])
		c+=x[i]*y[i]
		d+=x[i]*y[i]*Math.log(y[i])
		e+=y[i]
		f+=x[i]*x[i]
		g+=x[i]
		h+=x[i]*Math.log(y[i])
		j+=Math.log(y[i])
		i+=1

	end
		rescue
		puts "Cannot perform exponential regression on this data"
		return
	end

	#The following three coefficients use the advanced least squares equation
	acoeff1 = (a*b-c*d)/(e*a-c*c)
	bcoeff1 = ((e*d)-(c*b))/((e*a)-(c*c))
	ccoeff1 =2.718**acoeff1

	#These are the coefficients that get used in this project and are passed along
	acoeff2 = (j*f-g*h)/(n*f-g*g)
	bcoeff2=(n*h-g*j)/(n*f-g*g)
	ccoeff2 = Math::E**acoeff2

	z=0

	while z<x.count
		totalvariance+= (y[z]-ccoeff2*(Math::E**(bcoeff2*x[z])))**2
		z+=1
	end
	return ccoeff2.round(2), bcoeff2.round(2), totalvariance.round(2)
end











=begin
This is from project 1. Unnecessary for now but will use as a basis for line of best fit
#Checks second argument of input from cmd for type of regression to be used using regular expression to string match the type of regression desired.  If the argument is 'all', then will perform all 4 regressions and also output the variance of each.
if /logarithmic/.match(ARGV[1])
	Alog,Blog,varlog =logregress(@xarray,@yarray)
#checks if Alog exists, if it doesn't then an error was caught
	if Alog.nil?
		else
		puts "#{Alog}*ln(x) + #{Blog}"
	end

elsif /exponential/.match(ARGV[1])
	Aexp,Bexp,varexp = expregress(@xarray,@yarray)
#checks if Aexp exists, if it doesn't then an error was caught
	if Aexp.nil?
	else
		puts "#{Aexp}*e^#{Bexp}x"
	end

elsif /linear/.match(ARGV[1])
	slope, Yint, varlin = linearregress(@xarray,@yarray)
	puts "#{slope}x + #{Yint}"

elsif /polynomial/.match(ARGV[1])
		coeffarray, lowestvar, lowestdegree = multipoly(@xarray,@yarray)
		print "#{coeffarray[lowestdegree].round(2)}x^#{lowestdegree}"
		i=lowestdegree-1
	while i>0
		print " + #{coeffarray[i].round(2)}x^#{i}"
		i-=1
	end
	print " + #{coeffarray[0].round(2)}"

elsif /all/.match(ARGV[1])
	slope, Yint, varlin = linearregress(@xarray,@yarray)
	puts "Linear: #{slope}x + #{Yint}, SSE = #{varlin.round(2)}"
	Alog,Blog,varlog =logregress(@xarray,@yarray)
	if Alog.nil?
		else
		puts "Log: #{Alog}*ln(x) + #{Blog}, SSE = #{varlog.round(2)}"
	end

	Aexp,Bexp,varexp = expregress(@xarray,@yarray)
	if Aexp.nil?
	else
		puts "Exp: #{Aexp}*e^#{Bexp}x, SSE = #{varexp.round(2)}"
	end

	coeffarray, varpoly, lowestdegree = multipoly(@xarray,@yarray)
	print "Poly: #{coeffarray[lowestdegree].round(2)}x^#{lowestdegree}"
	i=lowestdegree-1
	while i>0
		print " + #{coeffarray[i].round(2)}x^#{i}"
	i-=1
	end
	print " + #{coeffarray[0].round(2)}, SSE = #{varpoly.round(2)}"

end

=end




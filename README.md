# cordic_based_nn_accelarator
The Given Repository Contains two major components -:
1) ReCON block , which is a multiply-accumalate unit , suited for vectors' scalar multiplication. It is based on the iterative CORDIC Alogirthm Approach , with a datapath consisting of adders , shifters and registers and controlpath carrying out iterations (n =10) for achieving certain accuracy in results.
Cordic Algorithm not only computed Multiply Accumate but also computes the activation function using hyperbolic mode , which include sigmoid , tanh and ReLU 
The binary representation of the numbers is 16 bit signed fixed point representation with 5 integer bits and 10 decimal bits. Thereby word size is 16 bits.
3) Using the ReCON block as a basic compute engine for multiplying two numbers and accumalating a result as the function of a neuron in a neural network.
4) The master engine consists of an array of 64 such compute units , a weight bank ( a shift registers of size 64 words with serial in , parallel out) , a bias bank ( a shift register of size 64 words with both parallel and serial in , with parallel out) and output bank (a shift register of size 64 words with parallel in.
5) Main Memory composed of Vivado IP Genrators' BRAM , used for storing weights and biases with certain reference addressing scheme.
6) Functionality -:
   ( Based on external start signal , and hardcoded input signal within the final datapath)
   1) Weights and Biases loaded , 64 clock cycles , with data serially loaded based on address incrementing and 1 word coming out of Main Memory every cycle.
   2) First layer computing done of the first dimension input vector , parallely for 64 neurons.
   3) Weights corresponding to second dimension serially brought in (again 64 clock cycles) and Bias updated with stage 2 result
   4) Steps (2) and (3) carried out for all m dimensions of the input.
   5) Finally entire layer computation done and stored in the output bank, and then this output bank loaded parallelly for all the outputs
   6) Output bank now serially gives each dimension as input for the neural network (NOTE -: This is a fully connected neural network)
   7) Finally once all the layers done , output bank stores final output as desired
  
      



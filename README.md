<h1>Neural Network Inferencing using CORDIC Algorithm based computing unit on FPGA </h1>
The Given Repository Contains two major components -:

1) ReCON block , which is a multiply-accumalate unit , suited for vectors' scalar multiplication. It is based on the iterative CORDIC Alogirthm Approach , with a datapath consisting of adders , shifters and registers and controlpath carrying out iterations (n =10) for achieving certain accuracy in results.
Cordic Algorithm not only computed Multiply Accumate but also computes the activation function using hyperbolic mode , which include sigmoid , tanh and ReLU 
The binary representation of the numbers is 16 bit signed fixed point representation with 5 integer bits and 10 decimal bits. Thereby word size is 16 bits.
3) Using the ReCON block as a basic compute engine for multiplying two numbers and accumalating a result as the function of a neuron in a neural network.Since RECON operates iteratively, it performs most efficiently within a specific input range. For inputs between -0.5 and 0.5, the error is minimal—only around 0.35%. However, as the input range increases to between 0.5 and 0.75, the error rises to approximately 5%, with further increases observed beyond this range.
4) For SIGMOID
![image](https://github.com/user-attachments/assets/202fe493-4ea1-44bd-918e-5b717c4cfff9)
where mac_out=(Xo*Zo)+Yo and f=sigmoid(mac_out)

5)For Relu
![image](https://github.com/user-attachments/assets/1b8af2cf-4fa7-49d2-98a7-ea6a282965e2)

![image](https://github.com/user-attachments/assets/c4fee3ad-1397-4d01-88f9-3ff69f2a42ea)

f=Relu(mac_out)



6) The master engine consists of an array of 64 such compute units , a weight bank ( a shift registers of size 64 words with serial in , parallel out) , a bias bank ( a shift register of size 64 words with both parallel and serial in , with parallel out) and output bank (a shift register of size 64 words with parallel in.
7) Main Memory composed of Vivado IP Genrators' BRAM , used for storing weights and biases with certain reference addressing scheme.
8) Functionality -:
   ( Based on external start signal , and hardcoded input signal within the final datapath)
   1) Weights and Biases loaded , 64 clock cycles , with data serially loaded based on address incrementing and 1 word coming out of Main Memory every cycle.
   2) First layer computing done of the first dimension input vector , parallely for 64 neurons.
   3) Weights corresponding to second dimension serially brought in (again 64 clock cycles) and Bias updated with stage 2 result
   4) Steps (2) and (3) carried out for all m dimensions of the input.
   5) Finally entire layer computation done and stored in the output bank, and then this output bank loaded parallelly for all the outputs
   6) Output bank now serially gives each dimension as input for the neural network (NOTE -: This is a fully connected neural network)
   7) Finally once all the layers done , output bank stores final output as desired
      
   NOTE-: Output Bank connected using VIVADO ILA Probes (IP) to check output bank value
   
   NOTE-: Python Code for exrtracting weights/biases out of neural network and storing it in .coe file and loaded in BRAM
  
      



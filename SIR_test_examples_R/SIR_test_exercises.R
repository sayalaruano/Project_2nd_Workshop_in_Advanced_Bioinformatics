# Test exercises with ER, WS and BA network models
# Import libraries 
library(igraph)

# Set a seed
set.seed(100)

# Create the models 
ER_g <- erdos.renyi.game(n = 100, p = 0.1)  

WS_g <- sample_smallworld(dim = 1, size = 100, 
                          nei = 5, p = 0.05) # dim of lattice, Nv, neighborhood 
                                             # within v are connected, rewiring p 

BA_g <- sample_pa(n = 100, power = 1, directed = FALSE) 

# Set number of figures to show 
par(mfrow=c(1, 3))

# Plot toy networks 
plot(ER_g, layout = layout_nicely(ER_g), vertex.label=NA, vertex.size=2.5) + title("Erdos-Renyi network")

plot(WS_g, layout = layout_nicely(WS_g), vertex.label=NA, vertex.size=2.5) + title("Watts-Strogatz network")

plot(BA_g, layout = layout_nicely(BA_g), vertex.label=NA, vertex.size=2.5) + title("Barabasi-Albert network")

# Apply SIR model in the networks 
SIR_ER <- sir(ER_g, beta= 5, gamma = 2)

SIR_WS <- sir(WS_g, beta= 5, gamma = 2)

SIR_BA <- sir(BA_g, beta= 5, gamma = 2)

# Plot SIR models 
plot(SIR_ER) + title("Erdos-Renyi SIR model")

plot(SIR_WS) + title("Watts-Strogatz SIR model")

plot(SIR_BA) + title("Barabasi-Albert SIR model")
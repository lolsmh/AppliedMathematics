from graphBuilders import *
from graphics import buildGraph

f = lambda a: (a[0]**2)/15 + a[1]**2

builders = [defGradientBuilder, steepestDespectBuilder, conjugateGradientBuilder, conjugateDirectionBuilder, newtonBuilder]

while True:
    print("Input: ")
    buildGraph(f, builders[int(input()) - 1])

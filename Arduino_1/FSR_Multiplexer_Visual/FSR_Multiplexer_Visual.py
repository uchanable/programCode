import serial
import matplotlib.pyplot as plt
from mpl_toolkits import mplot3d
from numpy import *

class Multichannel:

    def __init__(self, port_name='/dev/tty.usbserial-2110', baud_rate=9600):
        self.baud = baud_rate
        self.port = port_name

    # Initiate the serial reading
    def read_serial(self):
        try:
            ser = serial.Serial(self.port, self.baud)
            self.ser = ser
            print("Port has been found successfully!")
            ser.close()
        except:
            raise Exception('Check the Port')

    # 2D Gaussian distribution function
    def gaussian_2Ddist(self, x, y, mx=0, my=0, sx=1, sy=1):
        res = 1/(2*pi*sx*sy) * exp(-((x-mx)**2/(2*sx**2) + (y-my)**2/(2*sy**2)))
        return res

    # Convert serial data to actual values
    def data_decoder(self, n=6):
        data = str((self.ser.readline()).decode())
        data = data.split("-")
        v =  [float(x)/1024 for x in data]
        return v

    # Plotter function
    def plotter(self, v, axix, r=8, n=10, amp=6, sig=1.2): #amp 4, sig 0.8
# r = 가로축 세로축 길이, amp = 올라가는 높이, sig = 무게와 원넓이,  n = 마스의 갯수 매쉬 개수
        # making the meshgrid
        x = linspace(-r, r, n) # -r에서 r까지를 n간격으로 나눔
        y = linspace(-r, r, n) # -r에서 r까지를 n간격으로 나눔
        X, Y = meshgrid(x, y)

        # Combining the distributions of each valeu in a circle (radius=r/2)
        n = len(v)
        Z = zeros_like(X)
        for i, value in enumerate(v):
            Z = Z + value*self.gaussian_2Ddist(X, Y,
                                          mx=-6+4*(i%4), ## i%x
                                          my=-6+4*(int(i/4)%4), ## int(i/x)%y
                                          sx=sig, sy=sig)

       ## Z = Z + value*self.gaussian_2Ddist(X, Y,
                                         # mx=r/2*cos(2*pi*i/n),
                                         # my=r/2*sin(2*pi*i/n),
                                         # sx=sig, sy=sig)
        # amplifying the answer for better visualization
        Z = amp*Z

        # surface plot
        axix.plot_surface(X, Y, Z, cmap='viridis', edgecolor='none')
        axix.set_xlim(-r, r)
        axix.set_ylim(-r, r)
        axix.set_zlim(0, 1.2)
        plt.pause(0.0001)
        plt.show()
        axix.cla()


def main():

    # Calling the class
    MC = Multichannel()
    MC.read_serial()
    MC.ser.open()

    plt.ion()
    fig=plt.figure()
    ax = fig.add_subplot(1, 1, 1, projection='3d')

    # Start reading
    while True:
        v = MC.data_decoder()
        print(v)
        MC.plotter(v, ax)


if __name__ == '__main__':
  main()
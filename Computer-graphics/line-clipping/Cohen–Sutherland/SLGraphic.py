from PyQt5.QtWidgets import *
from PyQt5.QtGui import *
from PyQt5.QtCore import *
from mathmodule import *

WIDTH = 500
HIGHT = 480

class SLGraphicsScene(QGraphicsScene):
    def __init__(self, parent):
        super().__init__()
        self.parent = parent


    def mouseMoveEvent(self, event):
        parent = self.parent
        if parent.rb2.isChecked():
            parent.image.fill(Qt.white)
            parent.draw_borders()

            cord = event.scenePos()
            
            x = cord.x()
            y = cord.y()
            if (x >= 10 and y >= 10 and y <= HIGHT and x <= WIDTH):
                x += 2
                y += 10
                num = len(parent.edges)

                i = num
                
                if parent.capslock and i:
                    if y != parent.edges[i-1][1]:
                        der = ((x - parent.edges[i-1][0])/
                            (y - parent.edges[i-1][1]))
                    else:
                        der = 2
                    if abs(der) <= 1:
                        x = parent.edges[i-1][0]
                    else:
                        y = parent.edges[i-1][1]
                
                if num > 0 and not parent.cutter_flag:
                    parent.image.fill(Qt.white)
                    parent.draw_borders()
                    parent.Bresenham(parent.edges[num-1][0],
                                     parent.edges[num-1][1],
                                     x,y)

        if parent.rb1.isChecked():
            parent.image.fill(Qt.white)
            parent.draw_borders()

            cord = event.scenePos()
            
            x = cord.x()
            y = cord.y()
            if (x >= 10 and y >= 10 and y <= HIGHT and x <= WIDTH):
                x += 2
                y += 10

                xmin = 0; ymin = 0; dist_min = 99999
                
                for i in range(len(parent.edges)):
                    temp_x, temp_y = get_norm_dot(x,y,parent.edges[i],
                        parent.edges[(i+1)%len(parent.edges)])

                    dist = get_norm(x,y,parent.edges[i],
                        parent.edges[(i+1)%len(parent.edges)])

                    if dist == -1:
                        continue

                    if dist < dist_min:
                        xmin = temp_x
                        ymin = temp_y
                        dist_min = dist

                if parent.touch:
                    x = xmin
                    y = ymin

                num = len(parent.edges_slave)
                i = num

                if parent.capslock and i:
                    if y != parent.edges_slave[i-1][1]:
                        der = ((x - parent.edges_slave[i-1][0])/
                            (y - parent.edges_slave[i-1][1]))
                    else:
                        der = 2
                    if abs(der) <= 1:
                        x = parent.edges_slave[i-1][0]
                    else:
                        y = parent.edges_slave[i-1][1]
                
                if num > 0 and not parent.cutting_flag:
                    parent.image.fill(Qt.white)
                    parent.draw_borders()
                    parent.Bresenham(parent.edges_slave[num-1][0],
                                     parent.edges_slave[num-1][1],
                                     x,y,parent.colorhelp)


if __name__ == "__main__":
    pass

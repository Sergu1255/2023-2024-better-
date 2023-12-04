import tkinter as tk
from live import *
window = tk.Tk()
window.title("Hello world")
window.geometry("300x300")

hello = tk.Label(text="Hello world!")
hello.pack()
button = tk.Button(text="Click me!")
button.pack()


entry = tk.Entry(window)
entry.pack()
def display_variable():
    global a
    a = int(entry.get())
    
    return a
button = tk.Button(window, text="Display variable", command=display_variable)
button.pack()


tk.mainloop()

test = a
print(test)

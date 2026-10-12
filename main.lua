local ffi = require("ffi")

ffi.cdef[[
typedef void GLFWwindow;

int glfwInit(void);
void glfwTerminate(void);
void glfwPollEvents(void);
void glfwSwapBuffers(GLFWwindow* window);
GLFWwindow* glfwCreateWindow(int width, int height, const char* title, void* monitor, void* share);
void glfwDestroyWindow(GLFWwindow* window);
int glfwWindowShouldClose(GLFWwindow* window);
void glfwSetWindowShouldClose(GLFWwindow* window, int value);
int glfwGetKey(GLFWwindow* window, int key);
void glfwMakeContextCurrent(GLFWwindow* window);

void glClearColor(float red, float green, float blue, float alpha);
void glClear(unsigned int mask);
]]

local glfw = ffi.load("glfw3")
local opengl = ffi.load("opengl32")

local GLFW_PRESS = 1
local GLFW_KEY_ESCAPE = 256
local GL_COLOR_BUFFER_BIT = 0x00004000

assert(glfw.glfwInit() ~= 0, "Failed to initialize GLFW")

local window = glfw.glfwCreateWindow(960, 540, "LuaJIT Boilerplate", nil, nil)
if window == nil then
  glfw.glfwTerminate()
  error("Failed to create the GLFW window")
end

glfw.glfwMakeContextCurrent(window)
opengl.glClearColor(0.08, 0.10, 0.14, 1.0)

while glfw.glfwWindowShouldClose(window) == 0 do
  if glfw.glfwGetKey(window, GLFW_KEY_ESCAPE) == GLFW_PRESS then
    glfw.glfwSetWindowShouldClose(window, 1)
  end

  opengl.glClear(GL_COLOR_BUFFER_BIT)
  glfw.glfwSwapBuffers(window)
  glfw.glfwPollEvents()
end

glfw.glfwDestroyWindow(window)
glfw.glfwTerminate()

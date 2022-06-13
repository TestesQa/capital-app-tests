from robot.libraries.BuiltIn import BuiltIn
from robot.api.deco import keyword
from appium.webdriver.common.touch_action import TouchAction

@keyword(name="Drag And Drop")
def drag_rop(element_id, p_origin, p_destiny):
    #acessar biblioteca python em robot do momento e guarda em appiumlib e pega o driver
    appiumLib = BuiltIn().get_library_instance('AppiumLibrary')
    driver = appiumLib._current_application()

    # driver.find_elements_by_id(element_id) traz um array com os elementos
    # pegar o elemento da posição p_origin

    element_origin = driver.find_elements_by_id(element_id)[int(p_origin)]
    element_destiny = driver.find_elements_by_id(element_id)[int(p_destiny)]

    actions = TouchAction(driver)
    actions.long_press(element_origin).move_to(element_destiny)
    actions.release()
    actions.perform()
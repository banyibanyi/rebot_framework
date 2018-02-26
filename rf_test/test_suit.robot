
*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***

case set variable
    ${a}    Set variable    python
    log    ${a}

case Catenate
    ${b}    Catenate    hello   world
    log    ${b}

case Separator
    ${c}    Catenate    Separator=---   hello   world
    log    ${c}

case list
    @{abc}  Create List    a    b    c
    log many    @{abc}

case get time
    ${d}    get time
    log    ${d}

case sleep
    ${e}    get time
    log    ${e}
    sleep   5
    ${e}    get time
    log    ${e}

case If
    ${a}    Set variable    59
    Run Keyword If  ${a}>=90    log very good
    ...    ELSE IF    ${a}<=70    log    良好
    ...    ELSE IF    ${a}<=60    log    及格
    ...    ELSE    log    不及格

case for
    :FOR    ${i}    IN RANGE    10
    \    log    ${i}

case for each
#遍历list元素
    @{abc}    create list    a    b    c
    : FOR    ${i}    IN    @{abc}
    \    log    ${i}

case evauate
#进入python方法
    ${d}    Evaluate    random.randint(1000, 9999)    random
    log    ${d}

case import
#进入外部脚本、函数
    Import Library    C:/Users/c5267129/Documents/GitHub/rebot_framework/rf_test/count.py
    ${a}    Evaluate    int(4)
    ${b}    Evaluate    int(5)
    ${add}    add    ${a}    ${b}
    log    ${add}

case Baidu search
    Open Browser    https://www.baidu.com    chrome
    Input text    id:kw    selenium
    click button    id:su
    Evaluate    time.sleep(2)    time
    ${title}    Get Title
    should contain     ${title}     selenium
    close Browser
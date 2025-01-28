*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BASE_URL}                http://localhost:7272/Form.html
${COMPLETE_URL}            http://localhost:7272/Complete.html
${FIRST_NAME}              Somsong
${LAST_NAME}               Sandee
${DESTINATION}             Europe
${CONTACT_PERSON}          Sodsai Sandee
${RELATIONSHIP}            Mother
${EMAIL}                   somsong@kkumail.com
${PHONE_NO}                081-111-1234
${SUCCESS_PAGE_TITLE}      Completed
${SUCCESS_MESSAGE_1}       Our agent will contact you shortly.
${SUCCESS_MESSAGE_2}       Thank you for your patient.
${CHROME_DRIVER_PATH}      ${EXECDIR}${/}ChromeForTesting${/}chromedriver.exe

*** Test Cases ***
UAT-Lab7-001: Complete Form and Submit Successfully
    [Documentation]    ทดสอบการกรอกข้อมูลครบถ้วนในเว็บฟอร์ม Travel Insurance Inquiry
    Open Browser    ${BASE_URL}    Chrome    executable_path=${CHROME_DRIVER_PATH}
    Verify Form Is Displayed
    Fill Contact Form
    Submit Form
    Verify Submission Success
    Wait Until Page Contains Element    //h1[text()='Our agent will contact you shortly.']
    Page Should Contain    Completed
    Location Should Be    ${COMPLETE_URL}  # เช็คว่า URL ถูกต้อง
    Close Browser

*** Keywords ***
Verify Form Is Displayed
    Title Should Be    Travel Insurance Inquiry
    Page Should Contain Element    id=firstname
    Page Should Contain Element    id=lastname
    Page Should Contain Element    id=destination
    Page Should Contain Element    id=contactperson
    Page Should Contain Element    id=relationship
    Page Should Contain Element    id=email
    Page Should Contain Element    id=phone

Fill Contact Form
    Input Text    id=firstname    ${FIRST_NAME}
    Input Text    id=lastname     ${LAST_NAME}
    Input Text    id=destination   ${DESTINATION}
    Input Text    id=contactperson    ${CONTACT_PERSON}
    Input Text    id=relationship  ${RELATIONSHIP}
    Input Text    id=email         ${EMAIL}
    Input Text    id=phone         ${PHONE_NO}

Submit Form
    Click Button    id=submitButton

Verify Submission Success
    Title Should Be    ${SUCCESS_PAGE_TITLE}
    Page Should Contain    ${SUCCESS_MESSAGE_1}
    Page Should Contain    ${SUCCESS_MESSAGE_2}

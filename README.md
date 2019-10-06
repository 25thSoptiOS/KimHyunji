### 1st Assignment (Soptstagram)

- Auto Layout

- Round Image

  ```swift
  // 프로필 이미지 뷰
  @IBOutlet var imgSopt: UIImageView!
  
  // 프로필 이미지 둥글게 만들기
  imgSopt.layer.cornerRadius = 50/2
  ```

- Like Button Action

  ```swift
  // 버튼 동작을 위한 IBOutlet (하트 버튼)
  @IBOutlet var likeBtn: UIButton!
  
  // 버튼 클릭시 나타날 레이블
  @IBOutlet var text: UILabel!
  
  // 하트 버튼 눌렀을 때 동작하는 IBAction
  @IBAction func onClick(_ sender: Any) {
    if(check){
      self.text.text = "h._.jiee 님이 좋아합니다."
      self.likeBtn.setImage(afterBtn, for: .normal)
      check = false
    }
    else {
      self.text.text = ""
      self.likeBtn.setImage(beforeBtn, for: .normal)
      check = true
    }
  }
  ```
  ![](gifs/soptsatgram.gif)

### Switch-Image Action

- Switch on/off - Image change

  ```swift
  class CandleVC: UIViewController {
  
      @IBOutlet var candleImg: UIImageView!
      @IBOutlet var candleText: UILabel!
      
        // 상수에 이미지 지정
      let onImg = UIImage(named: "candle-on.jpg")
      let offImg = UIImage(named: "candle-off.jpg")
      
      override func viewDidLoad() {
          super.viewDidLoad()
      }
      
        // sender를 Any가 아닌 UISwitch로 선언
      @IBAction func candleAction(_ sender: UISwitch) {
        
          // 스위치 on
          if sender.isOn {
              candleText.text = "On"
              candleImg.image = onImg
          }
        
          // 스위치 off
          else {
              candleText.text = "Off"
              candleImg.image = offImg
          }
        
      }
  ```
  ![](gifs/candleonoff.gif)

### Background Color Change

- User Slider

  ```swift
          // 슬라이더 세개 IBOutlet 선언
          @IBOutlet var sliderRed: UISlider!
      @IBOutlet var sliderGreen: UISlider!
      @IBOutlet var sliderBlue: UISlider!
  
          // IBAction의 sender를 UISlider로 선언
      @IBAction func updateColor(_ sender: UISlider) {
        
          // 슬라이더 값을 받아와 view의 배경색 변경
          self.view.backgroundColor =
          UIColor.init(red:CGFloat(self.sliderRed.value),
          green: CGFloat(self.sliderGreen.value),
          blue: CGFloat(self.sliderBlue.value), alpha: 1.0)
        
      }
  ```
![](gifs/background.gif)

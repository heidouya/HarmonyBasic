import Footer from './components/Footer'
import Header from './components/Header'
import Main from './components/Main'

@Entry
@Component
struct CustomComponentPage {
  build() {
    Column(){
      Header()
      Main()
      Footer()
    }
  }
}
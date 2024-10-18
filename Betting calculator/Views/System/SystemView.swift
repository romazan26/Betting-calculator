import SwiftUI

struct SystemView: View {
    
    @StateObject var  vm: SystemViewModel
    @FocusState var keyboardFocus: Bool
    
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            VStack {
                
                VStack(alignment: .leading){
                    // Ввод размера системы
                    HStack {
                        Text("Type of system:")
                        
                        TextField("N", text: $vm.N)
                            .keyboardType(.numberPad)
                            .focused($keyboardFocus)
                            .padding()
                            .background {
                                Color.white
                                    .opacity(0.05)
                                    .cornerRadius(12)
                            }
                        Text("of")
                        
                        TextField("M", text: $vm.M)
                            .keyboardType(.numberPad)
                            .focused($keyboardFocus)
                            .padding()
                            .background {
                                Color.white
                                    .opacity(0.05)
                                    .cornerRadius(12)
                            }
                    }.foregroundStyle(.white)
                    
                    //MARK: - Bet
                    VStack(alignment: .leading){
                        Text("The amount of the bet")
                            .foregroundStyle(.white.opacity(0.7))
                        TextField("Text", text: $vm.stake)
                            .foregroundStyle(.white)
                            .focused($keyboardFocus)
                            .padding()
                            .background {
                                Color.white
                                    .opacity(0.05)
                                    .cornerRadius(12)
                            }
                    }
                    Text("The number of options in the express: \(vm.M)")
                        .foregroundStyle(.white)
                }
                .padding()
                .background {
                    Color.white
                        .opacity(0.05)
                        .cornerRadius(12)
                }
                ScrollView{
                    VStack{
                        // Заголовки для столбцов
                        HStack {
                            
                            Text("№")
                            Spacer()
                            // .frame(width: 30, alignment: .center) // Номер
                            Text("Ratio")
                                .padding(.horizontal)
                            Spacer()
                            // .frame(width: 100, alignment: .center) // Коэффициент
                            // Spacer()
                            Text("Win")
                            Spacer()
                            //  .frame(width: 80, alignment: .center) // Сыграла
                            Text("Refund")
                            Spacer()
                            //  .frame(width: 80, alignment: .center) // Возврат
                            Text("Loss")
                            Spacer()
                            // .frame(width: 80, alignment: .center) // Проиграла
                        }
                        .foregroundStyle(.white)
                        .font(.headline)
                        
                        
                        
                        
                        // Ввод коэффициентов для каждого события и выбор результата
                        VStack {
                            ForEach(0..<min(Int(vm.M) ?? 0, 12), id: \.self) { i in
                                HStack {
                                    
                                    Text("\(i + 1)")
                                        . frame(width: 30)
                                        .foregroundStyle(.white)
                                    Spacer()
                                    TextField("1", text: $vm.odds[i])
                                        . frame(width: 30)
                                        .foregroundStyle(.white)
                                        .keyboardType(.decimalPad)
                                        .focused($keyboardFocus)
                                        .padding()
                                        .background {
                                            Color.white
                                                .opacity(0.05)
                                                .cornerRadius(12)
                                        }
                                        .padding(.horizontal)
                                    
                                    Spacer()
                                    
                                    // Радиокнопки для каждого результата
                                    HStack {
                                        ForEach(BetResult.allCases, id: \.self) { result in
                                            RadioButton(selected: $vm.results[i], result: result)
                                            // .frame(width: 80, alignment: .center)
                                            Spacer()
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                    .background {
                        Color.white
                            .opacity(0.05)
                            .cornerRadius(12)
                    }
                    
                    // Вывод результата в требуемом формате
                    if vm.playedExpress > 0 || vm.unplayedExpress > 0 {
                        ResultSystemView(vm: vm)
                        
                    }
                }
                Spacer()
                
                //MARK: - Calculate button
                Button {
                    vm.calculateWin()
                } label: {
                    CustomButtonView(title: "Calculate", color: vm.stake == "" ? .gray : .orangeApp)
                }
                .disabled(vm.stake == "" ? true : false)
            }
        }
        .onTapGesture {
            keyboardFocus = false
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SystemView(vm: SystemViewModel())
    }
}

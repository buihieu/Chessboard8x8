//
//  ViewController.swift
//  Chessboard8x8
//
//  Created by Trung Anh on 10/16/14.
//  Copyright (c) 2014 PhamTrungAnh. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    
    //Declare array
    var array2D = Array<Array<UIView>>()
    var colums = 8
    var rows = 8
    var width: CGFloat = (375.0 - 20.0) / 8.0 // == 44.375
    
    //Declare image objects in Chess
    //var images: [UIImage] = []    //Dang bi loi

    var bishop1 = UIImageView(frame: CGRect(x: 44.375 * CGFloat(2) + 10.0, y: 44.375 * CGFloat(3) + 20.0 , width: 44.375, height: 44.375))
    var bishop2 = UIImageView(frame: CGRect(x: 44.375 * CGFloat(5) + 10.0, y: 44.375 * CGFloat(3) + 20.0 , width: 44.375, height: 44.375))
    var king = UIImageView(frame: CGRect(x: 44.375 * CGFloat(3) + 10.0, y: 44.375 * CGFloat(3) + 20.0 , width: 44.375, height: 44.375))
    var queen = UIImageView(frame: CGRect(x: 44.375 * CGFloat(4) + 10.0, y: 44.375 * CGFloat(3) + 20.0 , width: 44.375, height: 44.375))
    var knight1 = UIImageView(frame: CGRect(x: 44.375 * CGFloat(1) + 10.0, y: 44.375 * CGFloat(3) + 20.0 , width: 44.375, height: 44.375))
    var knight2 = UIImageView(frame: CGRect(x: 44.375 * CGFloat(6) + 10.0, y: 44.375 * CGFloat(3) + 20.0 , width: 44.375, height: 44.375))


    
    //Declare timer
    var timer = NSTimer()
    var countClickPlay = 0
    var colum = 0
    var row = 2
    
    
    @IBAction func play(sender: AnyObject) {
        countClickPlay += 1
        
        if (countClickPlay % 2 == 0) {
            timer.invalidate()
        }else {
            timer = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: Selector("move"), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func pause(sender: AnyObject) {
        timer.invalidate()
        countClickPlay = 0
    }
    
    @IBAction func refresh(sender: AnyObject) {
        timer.invalidate()
        countClickPlay = 0
        row = 2
        colum = 0
        bishop1.frame = array2D[0][2].frame
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Đổi màu nền ứng dụng
        self.view.backgroundColor = UIColor(red: 0.5, green: 0.55, blue: 0.97, alpha: 1.0)
        
        //Square
        var maxWidth = self.view.bounds.size.width
        var square: UIView
        //
        
        //Declare Array2D
        for colum in 0...7 {
            array2D.append(Array(count: rows, repeatedValue: UIView()))
        }
        
        //Initialize Array2D
        for colum in 0...7 {
            for row in 0...7 {
                
                //Xác định vị trí và kích thước hình vuông (x: ngang, y: dọc)
                square = UIView(frame: CGRect(x: width * CGFloat(row) + 10.0, y: width * CGFloat(colum + 3) + 20.0 , width: width, height: width))
                
                //Các ô ở dòng chẵn + cột chẵn thì đặt hình vuông màu vàng Champain
                if (colum % 2 == 0) {
                    if (row % 2 == 0) {
                        square.backgroundColor = UIColor(red: 0.94, green: 0.85, blue: 0.71, alpha: 1.0) //UIColor tương tác với mã màu RGBA
                    }else {
                        //Các ô ở dòng chẵn + cột lẻ thì đặt hình vuông màu nâu
                        square.backgroundColor = UIColor(red: 0.71, green: 0.51, blue: 0.39, alpha: 1.0)
                    }
                }else {
                    //Các ô ở dòng lẻ + cột chẵn thì đặt hình vuông màu nâu
                    if (row % 2 == 0) {
                        square.backgroundColor = UIColor(red: 0.71, green: 0.51, blue: 0.39, alpha: 1.0)
                    }else {
                        //Các ô ở dòng lẻ + cột lẻ thì đặt hình vuông màu vàng Champain
                        square.backgroundColor = UIColor(red: 0.94, green: 0.85, blue: 0.71, alpha: 1.0)
                    }
                }
                
                array2D[colum][row] = square
                self.view.addSubview(array2D[colum][row])
            }
        }
        //
        
        
        // *** them 2 image rook.png & pawn.png
        var images = [UIImage(named: "bishop.png"), UIImage(named: "king.png"), UIImage(named: "queen.png"), UIImage(named: "knight.png"), UIImage(named: "")]

        //Add image for UIImageView
        bishop1.image = images[0]
        bishop2.image = images[0]
        king.image = images[1]
        queen.image = images[2]
        knight1.image = images[3]
        knight2.image = images[3]

        
        //addSubview objects in chess
        self.view.addSubview(bishop1)
        self.view.addSubview(bishop2)
        self.view.addSubview(king)
        self.view.addSubview(queen)
        self.view.addSubview(knight1)
        self.view.addSubview(knight2)
    }
    
    
    //move Bishop
    func move() {
        colum += 1
        row += 1
        
        if colum < 8 && row < 8 {
            bishop1.frame = array2D[colum][row].frame
        }
    }
    
}


//Hàm này để remove thanh Status của iOS
//override func prefersStatusBarHidden() -> Bool {
//  return true
//}
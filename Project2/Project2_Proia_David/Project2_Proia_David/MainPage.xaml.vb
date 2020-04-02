'Program: Assignment 2 Noodle shop remake using a phone application
'Author:  David M. Proia
'Date:    Feb. 25, 2013
'Purpose: To allow a waiter or waitress to input as many orders as they wish and see the totals after clicking display bill

Partial Public Class MainPage
    Inherits PhoneApplicationPage

    ' Constructor
    Public Sub New()
        InitializeComponent()
    End Sub

    'contructors that allow the class to share specific variables that are used, such as total and using it again
    Dim decTotal As Decimal
    Dim decMainKit As Decimal
    Dim decMainMiso As Decimal
    Dim decMainZaru As Decimal
    Dim decMainHot As Decimal
    Dim _cdecTotal As Decimal = 0D
    Const _cdecTax As Decimal = 0.07D
    'Defaults the service to 15% unless otherwise selected using the scrollbar
    Const _cdecService As Decimal = 0.15D

    Private Sub btnOrder_Click(sender As System.Object, e As System.Windows.RoutedEventArgs) Handles btnOrder.Click
        'Had to use mini variables for class
        Dim decOrder As Decimal = decTotal
        Dim decKit As Decimal = 6.25D
        Dim decMiso As Decimal = 5.5D
        Dim decZaru As Decimal = 5.95D
        Dim decHot As Decimal = 1D

        If btnDisplay.IsPressed Then
            decMainHot = decHot
            decMainMiso = decMiso
            decMainKit = decKit
            decMainZaru = decZaru
            decTotal = decOrder
        ElseIf Not btnDisplay.IsPressed Then
            If btnOrder.IsPressed Then
                'Displays the subtotal button only after display bill is clicked
                lblSubTotal.Visibility = Windows.Visibility.Visible
                lblPrice.Visibility = Windows.Visibility.Visible
                'If loop that is used to allow the user to enter as many order's as they need
                If radKit.IsChecked Then
                    decMainKit += decKit
                ElseIf radMiso.IsChecked Then
                    decMainMiso += decMiso
                ElseIf radZaru.IsChecked Then
                    decMainZaru += decZaru
                End If
                If chkHot.IsChecked Then
                    decMainHot += decHot
                End If
                'Takes all the individual and total values of the order to be used later on
                decTotal = decMainKit + decMainMiso + decMainZaru + decMainHot
            End If

        End If
        'Takes the subtotal and places it in a label
        lblPrice.Text = decTotal.ToString("C")
        lblTotHot.Text = decMainHot.ToString("C")
        lblTotKit.Text = decMainKit.ToString("C")
        lblTotMiso.Text = decMainMiso.ToString("C")
        lblTotZaru.Text = decMainZaru.ToString("C")

    End Sub


    Private Sub btnDisplay_Click(sender As System.Object, e As System.Windows.RoutedEventArgs) Handles btnDisplay.Click
        Dim decTotWithAllMeals As Decimal
        Dim decTotalTax As Decimal
        Dim decTotalServiceCharge As Decimal
        'Display button when pressed calucates bill and hides main screen

        'Totals for each individual meals
        lblTotMiso.Text = decMainMiso
        lblTotKit.Text = decMainKit
        lblTotZaru.Text = decMainZaru
        lblTotHot.Text = decMainHot
        'Subtotal of all meals
        decTotWithAllMeals = decMainHot + decMainKit + decMainMiso + decMainZaru
        'Tax Fee 0.07 * Total, Without Service Fee
        decTotalTax = _cdecTax * decTotWithAllMeals
        lblTotTax.Text = decTotalTax.ToString("C")
        'Service Fee 0.15 * Total, without Tax
        decTotalServiceCharge = _cdecService * decTotWithAllMeals
        lblServiceFee.Text = decTotalServiceCharge.ToString("C")
        
        'Had to use an if statement here so if people wanted to change their services charges they can 
        If btnDisplay.IsPressed Then
            decTotalServiceCharge = 0

            'List box that allows the customer to change the service charge
            If lstMyBox.SelectedIndex = 0 Then
                decTotalServiceCharge = 0 * decTotWithAllMeals
                lblServiceFee.Text = decTotalServiceCharge.ToString("C")
            End If
            If lstMyBox.SelectedIndex = 1 Then
                decTotalServiceCharge = 0.01 * decTotWithAllMeals
                lblServiceFee.Text = decTotalServiceCharge.ToString("C")
            End If
            If lstMyBox.SelectedIndex = 2 Then
                decTotalServiceCharge = 0.02 * decTotWithAllMeals
                lblServiceFee.Text = decTotalServiceCharge.ToString("C")
            End If
            If lstMyBox.SelectedIndex = 3 Then
                decTotalServiceCharge = 0.03 * decTotWithAllMeals
                lblServiceFee.Text = decTotalServiceCharge.ToString("C")
            End If
            If lstMyBox.SelectedIndex = 4 Then
                decTotalServiceCharge = 0.04 * decTotWithAllMeals
                lblServiceFee.Text = decTotalServiceCharge.ToString("C")
            End If
            If lstMyBox.SelectedIndex = 5 Then
                decTotalServiceCharge = 0.05 * decTotWithAllMeals
                lblServiceFee.Text = decTotalServiceCharge.ToString("C")
            End If
            If lstMyBox.SelectedIndex = 6 Then
                decTotalServiceCharge = 0.06 * decTotWithAllMeals
                lblServiceFee.Text = decTotalServiceCharge.ToString("C")
            End If
            If lstMyBox.SelectedIndex = 7 Then
                decTotalServiceCharge = 0.07 * decTotWithAllMeals
                lblServiceFee.Text = decTotalServiceCharge.ToString("C")
            End If
            If lstMyBox.SelectedIndex = 8 Then
                decTotalServiceCharge = 0.08 * decTotWithAllMeals
                lblServiceFee.Text = decTotalServiceCharge.ToString("C")
            End If
            If lstMyBox.SelectedIndex = 9 Then
                decTotalServiceCharge = 0.09 * decTotWithAllMeals
                lblServiceFee.Text = decTotalServiceCharge.ToString("C")
            End If
            If lstMyBox.SelectedIndex = 10 Then
                decTotalServiceCharge = 0.1 * decTotWithAllMeals
                lblServiceFee.Text = decTotalServiceCharge.ToString("C")
            End If
            If lstMyBox.SelectedIndex = 11 Then
                decTotalServiceCharge = 0.11 * decTotWithAllMeals
                lblServiceFee.Text = decTotalServiceCharge.ToString("C")
            End If
            If lstMyBox.SelectedIndex = 12 Then
                decTotalServiceCharge = 0.12 * decTotWithAllMeals
                lblServiceFee.Text = decTotalServiceCharge.ToString("C")
            End If
            If lstMyBox.SelectedIndex = 13 Then
                decTotalServiceCharge = 0.13 * decTotWithAllMeals
                lblServiceFee.Text = decTotalServiceCharge.ToString("C")
            End If
            If lstMyBox.SelectedIndex = 14 Then
                decTotalServiceCharge = 0.14 * decTotWithAllMeals
                lblServiceFee.Text = decTotalServiceCharge.ToString("C")
            End If
            If lstMyBox.SelectedIndex = 15 Then
                decTotalServiceCharge = 0.15 * decTotWithAllMeals
                lblServiceFee.Text = decTotalServiceCharge.ToString("C")
            End If
        End If
        'Final Price = Service Fee + Tax + Subtotal
        lblFinalPrice.Text = (decTotWithAllMeals + decTotalServiceCharge + decTotalTax).ToString("C")


        'Shows the Display bill section
        txtThankYou.Visibility = Windows.Visibility.Visible
        lstMyBox.Visibility = Windows.Visibility.Visible
        lblTax.Visibility = Windows.Visibility.Visible
        lblTable.Visibility = Windows.Visibility.Visible
        lblServiceFee.Visibility = Windows.Visibility.Visible
        lblFinal.Visibility = Windows.Visibility.Visible
        lblFinalPrice.Visibility = Windows.Visibility.Visible
        lblTotHot.Visibility = Windows.Visibility.Visible
        lblTotKit.Visibility = Windows.Visibility.Visible
        lblTotMiso.Visibility = Windows.Visibility.Visible
        lblTotZaru.Visibility = Windows.Visibility.Visible
        lblTotTax.Visibility = Windows.Visibility.Visible
        lblDisHot.Visibility = Windows.Visibility.Visible
        lblDisKit.Visibility = Windows.Visibility.Visible
        lblDisMiso.Visibility = Windows.Visibility.Visible
        lblDisZaru.Visibility = Windows.Visibility.Visible
        'Collapses the main program so the bill can be seen
        lblHot.Visibility = Windows.Visibility.Collapsed
        lblKit.Visibility = Windows.Visibility.Collapsed
        lblMiso.Visibility = Windows.Visibility.Collapsed
        lblZaru.Visibility = Windows.Visibility.Collapsed
        picHot.Visibility = Windows.Visibility.Collapsed
        picKit.Visibility = Windows.Visibility.Collapsed
        picMain.Visibility = Windows.Visibility.Visible
        picMiso.Visibility = Windows.Visibility.Collapsed
        picZaru.Visibility = Windows.Visibility.Collapsed
        radKit.Visibility = Windows.Visibility.Collapsed
        radMiso.Visibility = Windows.Visibility.Collapsed
        radZaru.Visibility = Windows.Visibility.Collapsed
        chkHot.Visibility = Windows.Visibility.Collapsed
        btnOrder.Visibility = Windows.Visibility.Collapsed


    End Sub

    Private Sub btnClear_Click(sender As System.Object, e As System.Windows.RoutedEventArgs) Handles btnClear.Click

        'This allows the user to once again pick a table/order
        btnTable.Visibility = Windows.Visibility.Visible
        lblHot.Visibility = Windows.Visibility.Visible
        lblKit.Visibility = Windows.Visibility.Visible
        lblMiso.Visibility = Windows.Visibility.Visible
        lblTable.Visibility = Windows.Visibility.Visible
        lblZaru.Visibility = Windows.Visibility.Visible
        txtTable.Visibility = Windows.Visibility.Visible
        picHot.Visibility = Windows.Visibility.Visible
        picKit.Visibility = Windows.Visibility.Visible
        picMain.Visibility = Windows.Visibility.Visible
        picMiso.Visibility = Windows.Visibility.Visible
        picZaru.Visibility = Windows.Visibility.Visible
        radKit.Visibility = Windows.Visibility.Visible
        radMiso.Visibility = Windows.Visibility.Visible
        radZaru.Visibility = Windows.Visibility.Visible
        chkHot.Visibility = Windows.Visibility.Visible
        btnOrder.Visibility = Windows.Visibility.Visible
        'Collapses the Display bill section  
        txtThankYou.Visibility = Windows.Visibility.Collapsed
        lstMyBox.Visibility = Windows.Visibility.Collapsed
        lblTableSet.Visibility = Windows.Visibility.Collapsed
        lblSubTotal.Visibility = Windows.Visibility.Collapsed
        lblTotHot.Visibility = Windows.Visibility.Collapsed
        lblTotKit.Visibility = Windows.Visibility.Collapsed
        lblTotMiso.Visibility = Windows.Visibility.Collapsed
        lblTotZaru.Visibility = Windows.Visibility.Collapsed
        lblTotTax.Visibility = Windows.Visibility.Collapsed
        lblDisHot.Visibility = Windows.Visibility.Collapsed
        lblDisKit.Visibility = Windows.Visibility.Collapsed
        lblDisMiso.Visibility = Windows.Visibility.Collapsed
        lblDisZaru.Visibility = Windows.Visibility.Collapsed
        lblFinal.Visibility = Windows.Visibility.Collapsed
        lblFinalPrice.Visibility = Windows.Visibility.Collapsed
        lblTax.Visibility = Windows.Visibility.Collapsed
        lblServiceFee.Visibility = Windows.Visibility.Collapsed
        'clears out the text boxes so nothing is displayed
        lblTableSet.Text = ""
        txtTable.Text = ""
        lblPrice.Text = ""
        'clears all prices back to zero
        decTotal = 0D
        decTotal = 0D
        decMainKit = 0D
        decMainMiso = 0D
        decMainZaru = 0D
        decMainHot = 0D
        'defaults the list box back to -1 to erase the service charges
        lstMyBox.SelectedIndex = -1
    End Sub



    Private Sub btnTable_Click(sender As System.Object, e As System.Windows.RoutedEventArgs) Handles btnTable.Click
        
        'Allows the user to click a table and forces them to have to pick a numeric value
        If btnTable.IsPressed Then
            btnTable.Visibility = Windows.Visibility.Collapsed
            lblTableSet.Text = txtTable.Text.Trim
            lblTableSet.Visibility = Windows.Visibility.Visible
            txtTable.Visibility = Windows.Visibility.Collapsed
        End If


        
    End Sub
End Class
